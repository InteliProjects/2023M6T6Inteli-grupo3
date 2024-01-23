import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_dados_page/tela_principal_seduc_escolas_dados_page.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_page/tela_principal_seduc_escolas_page.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_screen/tela_principal_seduc_screen.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_title.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_seduc.dart';

// import _buildBarraDePesquisa;

class TelaPrincipalSeducEscolasDadosTabContainerScreen extends StatefulWidget {
  final Diretoria diretoria;

  const TelaPrincipalSeducEscolasDadosTabContainerScreen({Key? key, required this.diretoria})
      : super(key: key);

  @override
  TelaPrincipalSeducEscolasDadosTabContainerScreenState createState() =>
      TelaPrincipalSeducEscolasDadosTabContainerScreenState();
}

class TelaPrincipalSeducEscolasDadosTabContainerScreenState extends State<TelaPrincipalSeducEscolasDadosTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController = TabController(length: 2, vsync: this);
  late List<Escola> escolas = []; // Adicionado para armazenar escolas
  late List<Escola> escolas_filtradas = [];
  TextEditingController pesquisa = TextEditingController();
  bool isLoading = true; // Adicionado para controle de estado de carregamento

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    
    _fetchEscolas(); // Adicionado para carregar escolas na inicialização
  }

  _fetchEscolas() async {
    try {
      escolas = await ApiService().fetchEscolasPorDiretoria(widget.diretoria.nome); 
      setState(() {
        escolas_filtradas = escolas;
        isLoading = false;
      });
    } catch (e) {
      // Tratar exceção ou erro de carregamento
      print(e); // Por exemplo
    }
  }

  void filtragemPorPesquisa(String query){
    if (query.isEmpty){
      setState(() {
        escolas_filtradas = escolas;
      });
      return;
    }
    List<Escola> lista_temporaria_escola = [];
    for (Escola escola in escolas){
      if (escola.nome.toLowerCase().contains(query.toLowerCase())){
        lista_temporaria_escola.add(escola);
      }
    }
    setState(() {
      escolas_filtradas = lista_temporaria_escola;
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                  _buildComponentVariantSix(context),
                  Expanded(
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Column(children: [
                            _buildComponent(context),
                            Expanded(
                                child: SizedBox(
                                    height: 938.v,
                                    child: TabBarView(
                                        controller: tabviewController,
                                        children: [
                                          TelaPrincipalSeducEscolasPage(escolas: escolas_filtradas,
                                          ),
                                          TelaPrincipalSeducEscolasDadosPage(diretoria: widget.diretoria)
                                        ])))
                          ])))
                ])),
              
            bottomNavigationBar: _buildBottomBar(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked),
  );
}


Widget _buildBarraDePesquisa(BuildContext context) {
  return Container(
    height: 35,
    width: 350,
    child: TextField(
      onChanged: (query) {
        filtragemPorPesquisa(query);
      },
      controller: pesquisa,
      decoration: InputDecoration(
        labelText: "Buscar Escola",
        prefixIcon: Icon(Icons.search, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white), // Estilo para o texto do label (quando não está focado)
        floatingLabelStyle: TextStyle(color: Colors.white), // Estilo para o texto do label (quando está focado)
        contentPadding: EdgeInsets.symmetric(vertical: 2),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        enabledBorder: OutlineInputBorder( // Estilo da borda quando o TextField não está focado
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        focusedBorder: OutlineInputBorder( // Estilo da borda quando o TextField está focado
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0))
        ),
      ),
      style: TextStyle(color: Colors.white), // Estilo para o texto digitado pelo usuário
      cursorColor: Colors.white, // Cor do cursor
    ),
  );
}


  /// Section Widget
  Widget _buildComponentVariantSix(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6.v),
        decoration: AppDecoration.fillSecondaryContainer,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          SizedBox(height: 4.v),
          CustomAppBar(
              height: 45.v,
              leadingWidth: 68.h,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
                  margin: EdgeInsets.only(left: 36.h),
                  onTap: () {
                    onTapImage(context);
                  }),
              centerTitle: true,
              title: AppbarTitle(
              text: "Escolas\n${widget.diretoria.nome}",
            ),),
              SizedBox(height: 10.v),
              _buildBarraDePesquisa(context),
        ]));
  }

  /// Section Widget
  Widget _buildComponent(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 80.h, vertical: 9.v),
        decoration: AppDecoration.fillOnPrimary,
        child: Container(
            height: 40.v,
            width: 250.h,
            decoration: BoxDecoration(
                color: appTheme.blueGray100,
                borderRadius: BorderRadius.circular(20.h)),
            child: TabBar(
                controller: tabviewController,
                labelPadding: EdgeInsets.zero,
                labelColor: appTheme.black900,
                labelStyle: TextStyle(
                    fontSize: 14.fSize,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
                unselectedLabelColor: appTheme.black900,
                unselectedLabelStyle: TextStyle(
                    fontSize: 14.fSize,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
                indicatorPadding: EdgeInsets.all(5.0.h),
                indicator: BoxDecoration(
                    color: theme.colorScheme.onPrimary.withOpacity(1),
                    borderRadius: BorderRadius.circular(15.h),
                    border: Border.all(color: appTheme.black900, width: 1.h)),
                tabs: [
                      Tab(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
                        child: Text("Escolas"),
                      ),
                    ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
                      child: Text("Dados"),
                    ) 
                  )
                ])));
  }

  /// Section Widget


    Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarSeduc(
      onChanged: (BottomBarEnum type) {},
    );
  }

  /// Navigates to the telaPrincipalSeducScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}

// Modelo de dados para Diretoria
class Escola {
  final String cie;
  final String nome_diretoria;
  final String nome;
  final String endereco;
  final String numero;
  final String bairro;
  final String cep;

  Escola({required this.cie, required this.nome_diretoria, required this.nome, required this.endereco, required this.numero, required this.bairro, required this.cep});

  factory Escola.fromJson(Map<String, dynamic> json) {
    return Escola(
      cie: json['cie'],
      nome_diretoria: json['nome_diretoria'],
      nome: json['nome'],
      endereco: json['endereco'],
      numero: json['numero'],
      bairro: json['bairro'],
      cep: json['cep']
    );
  }
}

class ApiService {
  Future<List<Escola>> fetchEscolasPorDiretoria(String nomeDiretoria) async {
    final response = await http.get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/diretoria/$nomeDiretoria'));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> escolasJson = body['escolas'];
      return escolasJson.map((dynamic item) => Escola.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }
}

