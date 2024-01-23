import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:luis_s_application/UserState.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/login_escola_screen/login_escola_screen.dart';
import 'package:luis_s_application/presentation/tela_principal_escola_screen/widgets/telaprincipalescola_item_widget.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_finalizada_escola_screen/visualizar_remessa_finalizada_escola_screen.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_escola.dart';
import 'package:provider/provider.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class TelaPrincipalEscolaScreen extends StatelessWidget {
  final Remessa? remessa;
  TelaPrincipalEscolaScreen({Key? key, this.remessa}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildComponentFiftyThree(context),
                  SizedBox(height: 10.v),
                  _buildTelaprincipalescola(context),
                  SizedBox(height: 3.v),
                ])),
            bottomNavigationBar: _buildBottomBar(context), 
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
  }

  /// Section Widget
  Widget _buildComponentFiftyThree(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.v, horizontal: 12.h),
      decoration: AppDecoration.fillSecondaryContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          CustomAppBar(
            height: 25.v,
            centerTitle: true,
            title: AppbarSubtitle(text: "Remessas"),
            actions: [
              Row(
                children: [
                  SizedBox(width: 8.h), // Adicione um espaçamento entre os ícones
                  IconButton(
                    icon: Tooltip(
                      message: 'Sair',
                      child: Icon(Icons.logout_rounded),
                    ),
                    color: Colors.white70,
                    onPressed: () {
                      _showLogoutConfirmationDialog(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmação de Logout'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        content: Text('Tem certeza de que deseja fazer logout?'),
        contentTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w100,
          color: Colors.black,
        ),
        surfaceTintColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Cancelar'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
            )
          ),
          TextButton(
            onPressed: () {
              logout(context);
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Confirmar'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blueAccent,
            )
          ),
        ],
      );
    },
  );
}

  /// Section Widget
  Widget _buildTelaprincipalescola(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    final cieEscola = userState.cieEscola ?? '';
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: FutureBuilder<List<Remessa>>(
          future: fetchRemessas(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('Nenhuma remessa encontrada.');
            } else {
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 5.v);
                },
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final Remessa remessa = snapshot.data![index];

                  if (remessa.status_entrega != "Concluída") {
                    return TelaprincipalescolaItemWidget(
                      remessa: remessa,
                      cieEscola: cieEscola,
                      onTapComponent: () {
                        onTapComponent(context, remessa);
                      },
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }

  static void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('cieEscola');

    // Navegar de volta para a tela de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginEscolaScreen(),
      ),
    );
  }

  Future<List<Remessa>> fetchRemessas(BuildContext context) async {
    final userState = Provider.of<UserState>(context);
    final cieEscola = userState.cieEscola ?? '';
    final response = await http.get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entregas/status/$cieEscola'));

    if (response.statusCode == 200) {
      return parseRemessas(response.body);
    } else {
      throw Exception('Falha ao carregar remessas');
    }
  }

  List<Remessa> parseRemessas(String responseBody) {
    return List<Remessa>.from(json.decode(responseBody).map((item) => Remessa.fromJson(item)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarEscola(onChanged: (BottomBarEnum type) {});
  }

  onTapComponent(BuildContext context, Remessa? remessa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VisualizarRemessaFinalizadaEscolaScreen(remessa: remessa),
      ),
    );
  }
}
