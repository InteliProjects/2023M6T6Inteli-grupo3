import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_dados_tab_container_screen/tela_principal_seduc_escolas_dados_tab_container_screen.dart';
import 'package:luis_s_application/presentation/tela_remessas_concluidas_seduc_page/tela_remessas_concluidas_seduc_page.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_page/tela_remessas_em_andamento_seduc_page.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_title.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_seduc.dart';

class TelaRemessasEmAndamentoSeducTabContainerScreen extends StatefulWidget {
  final Escola? escola;

  const TelaRemessasEmAndamentoSeducTabContainerScreen({Key? key, this.escola})
      : super(
          key: key,
        );

  @override
  TelaRemessasEmAndamentoSeducTabContainerScreenState createState() =>
      TelaRemessasEmAndamentoSeducTabContainerScreenState();
}

class TelaRemessasEmAndamentoSeducTabContainerScreenState
    extends State<TelaRemessasEmAndamentoSeducTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController = TabController(length: 2, vsync: this);
  late List<Remessa> remessas = [];
  late List<Remessa> remessasConcluidas = [];

  late List<Remessa> remessas_filtradas = [];
  late List<Remessa> remessas_filtradas_concluidas = [];
  bool isLoading = true;
  TextEditingController pesquisa = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _fetchData();
    });
  }

  _fetchData() async {
    try {
      List<Remessa> remessasResponse =
          await ApiService().fetchRemessas(widget.escola?.cie);
      remessasResponse.forEach((remessa) {
        if (remessa.status_entrega == "Concluída") {
          remessasConcluidas.add(remessa);

          remessas_filtradas_concluidas = remessasConcluidas;
        } else {
          remessas.add(remessa);
          remessas_filtradas = remessas;
        }
      });
      setState(() {
        isLoading = false;
        remessas_filtradas = List.from(remessas);
        remessas_filtradas_concluidas = List.from(remessasConcluidas);
      });
    } catch (e) {
      // Tratar exceção ou erro de carregamento
      print(e); // Por exemplo
    }
  }

  void filtragemPorPesquisa(String query) {
    if (query.isEmpty) {
      setState(() {
        remessas_filtradas = remessas;
        remessas_filtradas_concluidas = remessasConcluidas;
      });
      return;
    }
    List<Remessa> lista_temporaria_remessas = [];
    for (Remessa remessa in remessas) {
      if (remessa.n_nota_fiscal.toLowerCase().contains(query.toLowerCase())) {
        lista_temporaria_remessas.add(remessa);
      }
    }
    List<Remessa> lista_temporaria_remessas_concluidas = [];
    for (Remessa remessa_concluida in remessasConcluidas) {
      if (remessa_concluida.n_nota_fiscal
          .toLowerCase()
          .contains(query.toLowerCase())) {
        lista_temporaria_remessas_concluidas.add(remessa_concluida);
      }
    }

    setState(() {
      remessas_filtradas = lista_temporaria_remessas;
      remessas_filtradas_concluidas = lista_temporaria_remessas_concluidas;
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
              _buildComponentVariantFour(context),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      _buildComponentVariantThree(context),
                      Expanded(
                        child: SizedBox(
                          height: 704.v,
                          child: TabBarView(
                            controller: tabviewController,
                            children: [
                              TelaRemessasEmAndamentoSeducPage(
                                  remessas: remessas_filtradas,
                                  isLoading: false),
                              TelaRemessasConcluidasSeducPage(
                                  remessasConcluidas:
                                      remessas_filtradas_concluidas),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.v),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
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
          labelText: "Buscar Remessa",
          prefixIcon: Icon(Icons.search, color: Colors.white),
          labelStyle: TextStyle(
              color: Colors
                  .white), // Estilo para o texto do label (quando não está focado)
          floatingLabelStyle: TextStyle(
              color: Colors
                  .white), // Estilo para o texto do label (quando está focado)
          contentPadding: EdgeInsets.symmetric(vertical: 2),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          enabledBorder: OutlineInputBorder(
            // Estilo da borda quando o TextField não está focado
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          focusedBorder: OutlineInputBorder(
              // Estilo da borda quando o TextField está focado
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
        style: TextStyle(
            color: Colors.white), // Estilo para o texto digitado pelo usuário
        cursorColor: Colors.white, // Cor do cursor
      ),
    );
  }

  /// Section Widget
  Widget _buildComponentVariantFour(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.v),
      decoration: AppDecoration.fillSecondaryContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              text: "Remessas\n${widget.escola!.nome}",
            ),
          ),
          SizedBox(height: 10),
          _buildBarraDePesquisa(context),
          // _buildBarraDePesquisa(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildComponentVariantThree(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 44.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillOnPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Container(
            height: 40.v,
            width: 320.h,
            decoration: BoxDecoration(
              color: appTheme.blueGray100,
              borderRadius: BorderRadius.circular(
                20.h,
              ),
            ),
            child: TabBar(
              controller: tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: appTheme.black900,
              labelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: appTheme.black900,
              unselectedLabelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
              indicatorPadding: EdgeInsets.all(
                5.0.h,
              ),
              indicator: BoxDecoration(
                color: theme.colorScheme.onPrimary.withOpacity(1),
                borderRadius: BorderRadius.circular(
                  15.h,
                ),
                border: Border.all(
                  color: appTheme.black900,
                  width: 1.h,
                ),
              ),
              tabs: [
                Tab(
                    child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.h),
                  child: Text("Pendentes"),
                )),
                Tab(
                    child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.h),
                  child: Text("Concluídas"),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarSeduc(
      onChanged: (BottomBarEnum type) {},
    );
  }

  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}

class Remessa {
  final String n_nota_fiscal;
  final String cnpj_fornecedor;
  final String cnpj_transportadora;
  final String cie_escola;
  final String? gpb_ger;
  final String data_estimada_inicio;
  String get data_estimada_inicio_formatada =>
      formatDate(data_estimada_inicio.toString());
  final String data_estimada_fim;
  String get data_estimada_fim_formatada =>
      formatDate(data_estimada_fim.toString());
  final String status_entrega;
  final String email_usuario_transportadora;
  final String email_usuario_escola;
  final String? data_entregue;
  // String? get data_entregue_formatada => formatDate(data_entregue.toString());
  final bool prova_entrega;
  final String data_criacao;
  String get data_criacao_formatada => formatDate(data_criacao.toString());
  final String placa;
  final int valor;
  final String codigo_unico;
  final String data_inicio_entrega;
  String get data_inicio_entrega_formatada => formatDate(data_inicio_entrega.toString());

  Remessa(
      {required this.n_nota_fiscal,
      required this.cnpj_fornecedor,
      required this.cnpj_transportadora,
      required this.cie_escola,
      required this.gpb_ger,
      required this.data_estimada_inicio,
      required this.data_estimada_fim,
      required this.status_entrega,
      required this.email_usuario_transportadora,
      required this.email_usuario_escola,
      this.data_entregue,
      required this.prova_entrega,
      required this.data_criacao,
      required this.placa,
      required this.valor,
      required this.codigo_unico,
      required this.data_inicio_entrega});

  factory Remessa.fromJson(Map<String, dynamic> json) {
    return Remessa(
        n_nota_fiscal: json['n_nota_fiscal'] ?? 'covas',
        cnpj_fornecedor: json['cnpj_fornecedor'],
        cnpj_transportadora: json['cnpj_transportadora'],
        cie_escola: json['cie_escola'],
        gpb_ger: json['gpb_ger'],
        data_estimada_inicio: json['data_estimada_inicio'],
        data_estimada_fim: json['data_estimada_fim'],
        status_entrega: json['status_entrega'] ?? 'covas',
        email_usuario_transportadora: json['email_usuario_transportadora'],
        email_usuario_escola: json['email_usuario_escola'],
        data_entregue: json['data_entregue'].toString(),
        prova_entrega: json['prova_entrega'] ?? 'covas',
        data_criacao: json['data_criacao'],
        placa: json['placa'] ?? 'covas',
        valor: json['valor'],
        codigo_unico: json['codigo_unico'],
        data_inicio_entrega: json['data_inicio_entrega'].toString());
  }

  static String formatDate(dateToFormat) {
    if (dateToFormat != null) {
      DateTime tempDate = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'")
          .parse(dateToFormat, true)
          .toLocal();
      String formattedDate = DateFormat('dd/MM/yy').format(tempDate);
      return formattedDate;
    } else {
      return 'Sem data estimada';
    }
  }
}

class ApiService {
  Future<List<Remessa>> fetchRemessas(cie_escola) async {
    print("Entrou na req");
    final response = await http
        .get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entregas/status/${cie_escola}'));
    print("passou da req");

    if (response.statusCode == 200) {
      print("response: ");
      print(response);
      List<dynamic> body = jsonDecode(response.body);
      print("body: ");
      print(body);
      return body.map((item) => Remessa.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }
}
