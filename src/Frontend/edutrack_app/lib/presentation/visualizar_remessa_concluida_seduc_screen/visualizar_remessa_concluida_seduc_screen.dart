import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_a_caminho_escola_one_screen/tela_de_rastreio_a_caminho_escola_one_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_entregue_seduc_screen/tela_de_rastreio_entregue_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_pendendte_seduc_screen/tela_de_rastreio_pendendte_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_title.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_seduc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore_for_file: must_be_immutable
class VisualizarRemessaConcluidaSeducScreen extends StatefulWidget {
  final Remessa? remessa;

  const VisualizarRemessaConcluidaSeducScreen({Key? key, this.remessa})
      : super(key: key);

  @override
  VisualizarRemessaConcluidaSeducScreenState createState() =>
      VisualizarRemessaConcluidaSeducScreenState();
}

class VisualizarRemessaConcluidaSeducScreenState
    extends State<VisualizarRemessaConcluidaSeducScreen>
    with TickerProviderStateMixin {
  TextEditingController group176Controller = TextEditingController();

  TextEditingController group177Controller = TextEditingController();

  TextEditingController NotaFiscalController = TextEditingController();

  TextEditingController exCounterController = TextEditingController();

  TextEditingController exCounterController1 = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController exController = TextEditingController();

  TextEditingController exMonitoresController = TextEditingController();

  TextEditingController exCounterController2 = TextEditingController();
  bool isLoading = true;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  late String nome_fornecedora = "nome fornecedora";

  late String nome_transportadora = "nome transportadora";

  @override
  void initState() {
    super.initState();
    _fetch_fornecedora();
    _fetch_transportadora();
  }

  _fetch_fornecedora() async {
    try {
      String nome_fornecedora2 = await ApiService()
          .fetchFornecedorabyCnpj(widget.remessa?.cnpj_fornecedor);
      print(nome_fornecedora2);
      setState(() {
        nome_fornecedora = nome_fornecedora2;
        // isLoading = false;
      });
    } catch (e) {
      // Tratar exceção ou erro de carregamento
      print(e); // Por exemplo
    }
  }

  _fetch_transportadora() async {
    try {
      String nome_transportadora2 = await ApiService()
          .fetchTransportadorabyCnpj(widget.remessa?.cnpj_transportadora);
      print(nome_transportadora2);
      setState(() {
        nome_transportadora = nome_transportadora2;
        isLoading = false;
      });
    } catch (e) {
      // Tratar exceção ou erro de carregamento
      print(e); // Por exemplo
    }
  }

  // await ApiService().fetchTransportadorabyCnpj();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      _buildComponentVariantFour(context),
                      SizedBox(height: 15.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.h, right: 20.h, bottom: 5.v),
                                  child: Column(children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Fornecedora:",
                                            style: CustomTextStyles
                                                .bodyMediumInter)),
                                    SizedBox(height: 4.v),
                                    _buildGroup176(context),
                                    SizedBox(height: 16.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Transportadora:",
                                            style: CustomTextStyles
                                                .bodyMediumInter)),
                                    SizedBox(height: 3.v),
                                    _buildGroup177(context),
                                    SizedBox(height: 16.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Numero NF:",
                                            style: CustomTextStyles
                                                .bodyMediumInter)),
                                    SizedBox(height: 3.v),
                                    _buildNotaFiscal(context),
                                    SizedBox(height: 15.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 73.h),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Valor:",
                                                      style: CustomTextStyles
                                                          .bodyMediumInter),
                                                  Text("Data estimada:",
                                                      style: CustomTextStyles
                                                          .bodyMediumInter)
                                                ]))),
                                    SizedBox(height: 3.v),
                                    _buildPrice1(context),
                                    SizedBox(height: 30.v),
                                  ]))))
                    ])),
            bottomNavigationBar: _buildBottomBar(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
  }

  Widget _buildTextFormField(String? initialValue) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      style: TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      enabled: false,
      showCursor: false,
      enableInteractiveSelection: false,
    );
  }

  /// Section Widget
  Widget _buildComponentVariantFour(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6.v),
        decoration: AppDecoration.fillSecondaryContainer,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 4.v),
          CustomAppBar(
              height: 32.v,
              leadingWidth: 68.h,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
                  margin: EdgeInsets.only(left: 36.h),
                  onTap: () {
                    onTapImage(context);
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "Remessas"))
        ]));
  }

  /// Section Widget
  Widget _buildGroup176(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width - 40, // Exemplo de largura limitada
      child: _buildTextFormField(nome_fornecedora),
    );
  }

  /// Section Widget
  Widget _buildGroup177(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width - 40, // Exemplo de largura limitada
      child: _buildTextFormField(nome_transportadora),
    );
  }

  /// Section Widget
  Widget _buildNotaFiscal(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width - 40, // Exemplo de largura limitada
      child: _buildTextFormField(widget.remessa?.n_nota_fiscal),
    );
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 0.h),
            child: Container(
              width: MediaQuery.of(context).size.width -
                  40, // Exemplo de largura limitada
              child: _buildTextFormField(
                  "R\$ " + widget.remessa!.valor.toString() + ",00"),
            )));
  }

  /// Section Widget
  Widget _buildEx(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 0.h),
            child: Container(
              width: MediaQuery.of(context).size.width -
                  40, // Exemplo de largura limitada
              child: _buildTextFormField(
                  widget.remessa?.data_estimada_fim_formatada),
            )));
  }

  /// Section Widget
  Widget _buildPrice1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: _buildPrice(context)), // Envolva com Container
        SizedBox(width: 5), // Adicione um espaço entre eles, se necessário
        Container(child: _buildEx(context)), // Envolva com Container
      ],
    );
  }

  /// Section Widget
  Widget _buildExMonitores(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width - 40, // Exemplo de largura limitada
      child: _buildTextFormField(widget.remessa?.gpb_ger),
    );
  }

  /// Section Widget
  Widget _buildExCounter3(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width - 40, // Exemplo de largura limitada
      child: _buildTextFormField(
          "R\$ " + widget.remessa!.valor.toString() + ",00"),
    );
  }


  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarSeduc(
      onChanged: (BottomBarEnum type) {},
    );
  }

  /// Navigates to the telaRemessasConcluidaSeducTabContainerScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
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

  Future<String> fetchTransportadorabyCnpj(cnpj_transportadora) async {
    final response = await http.get(Uri.parse(
        "http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/transportadora/${cnpj_transportadora}"));
    dynamic transportadora = jsonDecode(response.body);

    transportadora = Transportadora.fromJson(transportadora);
    print(transportadora);
    print(transportadora.nome);
    return transportadora.nome;
  }

  Future<String> fetchFornecedorabyCnpj(cnpj_fornecedora) async {
    final response = await http.get(
        Uri.parse("http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/fornecedor/${cnpj_fornecedora}"));
      dynamic fornecedora = jsonDecode(response.body);
      fornecedora = Fornecedora.fromJson(fornecedora);
      return fornecedora.nome;
  }
}

class Transportadora {
  final String nome;

  Transportadora({required this.nome});

  factory Transportadora.fromJson(Map<String, dynamic> json) {
    return Transportadora(nome: json['nome']);
  }
}

class Fornecedora {
  final String nome;

  Fornecedora({required this.nome});

  factory Fornecedora.fromJson(Map<String, dynamic> json) {
    return Fornecedora(nome: json['nome']);
  }
}
