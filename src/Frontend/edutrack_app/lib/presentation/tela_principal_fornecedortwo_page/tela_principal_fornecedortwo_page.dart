import 'package:luis_s_application/presentation/login_fornecedor_screen/login_fornecedor_screen.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_dados_tab_container_screen/tela_principal_seduc_escolas_dados_tab_container_screen.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_fornecedor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../tela_principal_fornecedortwo_page/widgets/telaprincipalfornecedortwo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaPrincipalFornecedortwoPage extends StatefulWidget {
  const TelaPrincipalFornecedortwoPage({Key? key}) : super(key: key);

  @override
  TelaPrincipalFornecedortwoPageState createState() =>
      TelaPrincipalFornecedortwoPageState();
}

class TelaPrincipalFornecedortwoPageState
    extends State<TelaPrincipalFornecedortwoPage>
    with TickerProviderStateMixin {

  late List<Remessa> remessas = [];
  late List<Map<String, dynamic>> nomes_escolas = [];
  bool isLoading = true;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    try {
      print("indo pro fetchRemessas");
      remessas = await ApiService().fetchRemessas();

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
                  _buildComponentVariantThree(context),
                  SizedBox(height: 21.v),
                  _buildTelaprincipalfornecedorTwo(context),
                  SizedBox(height: 2.v),
                  _buildBottomBar(context)
                ]))));
  }

  /// Section Widget
  Widget _buildComponentVariantThree(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12.v),
        decoration: AppDecoration.fillSecondaryContainer,
        child: CustomAppBar(
            height: 26.v,
            leadingWidth: 66.h,
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
            ));
  }

  /// Section Widget
  Widget _buildTelaprincipalfornecedorTwo(BuildContext context) {
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
                  return TelaprincipalfornecedortwoItemWidget(
                  
                  remessa: remessas[index],
                  nome_escola: nomes_escolas[index]['escola_nome'],
                  );
                }
            )
        )
    );
  }

    Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarFornecedor(
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
    prefs.remove('emailFornecedor');
    prefs.remove('cnpjFornecedor');

    // Navegar de volta para a tela de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginFornecedorScreen(),
      ),
    );
  }
}

class ApiService {
  Future<List<Remessa>> fetchRemessas() async {
    print("Entrou na req");
    final response = await http.get(Uri.parse(
        'http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entrega/fornecedor/00.369.6460001-40'));
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
