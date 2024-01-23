import 'package:luis_s_application/UserState.dart';
import 'package:luis_s_application/presentation/login_fornecedor_screen/login_fornecedor_screen.dart';
import 'package:luis_s_application/presentation/login_transportadora_screen/login_transportadora_screen.dart';
import 'package:luis_s_application/presentation/entrega_em_andamento_entregador_screen/entrega_em_andamento_entregador_screen.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_dados_tab_container_screen/tela_principal_seduc_escolas_dados_tab_container_screen.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_entregador.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../tela_principal_entregador_page/widgets/telaprincipalentregador_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaPrincipalEntregadorPage extends StatefulWidget {
  const TelaPrincipalEntregadorPage({Key? key}) : super(key: key);

  @override
  TelaPrincipalEntregadorPageState createState() =>
      TelaPrincipalEntregadorPageState();
}

class TelaPrincipalEntregadorPageState extends State<TelaPrincipalEntregadorPage> with TickerProviderStateMixin {
  late List<Remessa> remessas = [];
  late List<Map<String, dynamic>> nomes_escolas = [];
  bool isLoading = true;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  late UserState userState; // Declare a variable to hold the UserState

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userState = Provider.of<UserState>(context); // Retrieve the UserState in didChangeDependencies
    _fetchData();
  }

  _fetchData() async {
    try {
      print("indo pro fetchRemessas");
      remessas = await ApiService().fetchRemessas(context);

      // Carregar os nomes das escolas em paralelo
      List<Future<Map<String, dynamic>>> nomesEscolasFutures = remessas
          .map((remessa) =>
              ApiService().fetchEscolabyCie_escola(remessa.cie_escola))
          .toList();

      // Aguardar todas as chamadas assíncronas serem concluídas
      nomes_escolas = await Future.wait(nomesEscolasFutures);

      print("Olha as remessas: ");
      print(remessas);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // Tratar exceção ou erro de carregamento
      print(e); // Por exemplo
    }
  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillOnPrimary,
                child: Column(children: [
                  _buildComponentFiftyThree(context),
                  SizedBox(height: 21.v),
                  _buildTelaprincipalentregador(context, remessas),
                  _buildBottomBar(context),
                ]))));
  }

  /// Section Widget
  Widget _buildComponentFiftyThree(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12.v),
        decoration: AppDecoration.fillSecondaryContainer,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 3.v),
          CustomAppBar(
              height: 25.v,
              centerTitle: true,
              title: AppbarSubtitle(text: "Remessas"),
              actions: [
                AppbarTrailingImage(
                    imagePath: ImageConstant.imgNotification,
                    margin: EdgeInsets.symmetric(horizontal: 40.h)),
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
              ])
        ]));
  }

  /// Section Widget
  Widget _buildTelaprincipalentregador(
      BuildContext context, List<Remessa> remessas) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.v);
                },
                itemCount: remessas.length,
                itemBuilder: (context, index) {
                  return TelaprincipalentregadorItemWidget(
                      
                      remessa: remessas[index],
                      nome_escola: nomes_escolas[index]['escola_nome'],
                      endereco: nomes_escolas[index]['escola_endereco'],
                      numero: nomes_escolas[index]['escola_numero'],
                      bairro: nomes_escolas[index]['escola_bairro'],
                      cep: nomes_escolas[index]['escola_cep'], 
                      
                      );
                })));
  }

  /// Navigates to the entregaEmAndamentoEntregadorScreen when the action is triggered.
  
    Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarEntregador(
      onChanged: (BottomBarEnum type) {},
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

  static void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('emailTransportadora');
    prefs.remove('cnpjTransportadora');

    // Navegar de volta para a tela de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginTransportadoraScreen(),
      ),
    );
  }
}

class ApiService {
  Future<List<Remessa>> fetchRemessas(BuildContext context) async {
    print("Entrou na req");
    final userState = Provider.of<UserState>(context);
    final cnpj_transportadora = userState.cnpjTransportadora ?? '';
    
    final response = await http.get(Uri.parse(
        'http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entrega/transportadora/$cnpj_transportadora'));
    print("passou da req");

    if (response.statusCode == 200) {
      print("response: ");
      print(response);
      List<dynamic> body = jsonDecode(response.body);
      print("body: ");
      print(body);
      return body = body.map((item) => Remessa.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }

  Future<Map<String, dynamic>> fetchEscolabyCie_escola(cie_escola) async {
    // print("cie_escola: " + cie_escola);
    final response =
        await http.get(Uri.parse("http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/escola/${cie_escola}"));
    dynamic escola = jsonDecode(response.body);
    // print("escola:" + escola.toString());
    escola = Escola.fromJson(escola);
    return {
      "escola_nome": escola.nome,
      "escola_endereco": escola.endereco,
      "escola_numero": escola.numero,
      "escola_bairro": escola.bairro,
      "escola_cep": escola.cep,
    };
  }
}