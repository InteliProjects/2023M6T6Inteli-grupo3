// Importa os pacotes necessários do Flutter
import 'dart:convert';
import 'package:luis_s_application/UserState.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_escola.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../historico_de_remessas_screen/widgets/historicoderemessas_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';

// Tela que exibe o histórico de remessas
class HistoricoDeRemessasScreen extends StatelessWidget {
  HistoricoDeRemessasScreen({Key? key}) : super(key: key);

  // Chave global para o estado do navegador
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // Constrói a interface da tela
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        // Barra de aplicativo personalizada
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 21.v),
              // Lista de itens do histórico de remessas
              _buildHistoricoderemessas(context),
            ],
          ),
        ),
        // Barra de navegação inferior personalizada
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Seção do Widget para construir a barra de aplicativo personalizada
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
        margin: EdgeInsets.only(
          left: 39.h,
          top: 12.v,
          bottom: 10.v,
        ),
        onTap: () {
          Navigator.popAndPushNamed(context, AppRoutes.telaPrincipalEscolaScreen);
        },
      ),
      centerTitle: true,
      title: SizedBox(
        height: 27.07.v,
        width: 94.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Subtítulo da barra de aplicativo
            AppbarSubtitle(
              text: "Histórico",
              margin: EdgeInsets.only(top: 2.v),
            ),
          ],
        ),
      ),
      // Ícone de pesquisa na barra de aplicativo
      styleType: Style.bgFill,
    );
  }

  /// Seção do Widget para construir a lista de itens do histórico de remessas
Widget _buildHistoricoderemessas(BuildContext context) {
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
              final List<Remessa> remessasConcluidas = snapshot.data!
                  .where((remessa) => remessa.status_entrega == 'Concluída')
                  .toList();

              return ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.v);
                },
                itemCount: remessasConcluidas.length,
                itemBuilder: (context, index) {
                  final Remessa remessa = remessasConcluidas[index];

                  return HistoricoderemessasItemWidget(
                    remessa: remessa,
                    cieEscola: remessa.cie_escola,
                    notaFiscal: remessa.n_nota_fiscal,
                  );
                },
              );
            }
          },
        ),
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

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarEscola(
      onChanged: (BottomBarEnum type) {},
    );
  }
}
