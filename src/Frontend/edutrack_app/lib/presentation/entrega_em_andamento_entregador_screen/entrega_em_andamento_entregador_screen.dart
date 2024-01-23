import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/login_transportadora_screen/login_transportadora_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_concluida_seduc_screen/visualizar_remessa_concluida_seduc_screen.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_title.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_entregador.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class EntregaEmAndamentoEntregadorScreen extends StatefulWidget {
  final Remessa? remessa;
  EntregaEmAndamentoEntregadorScreen({Key? key, this.remessa})
      : super(key: key);

  @override
  EntregaEmAndamentoEntregadorScreenState createState() =>
      EntregaEmAndamentoEntregadorScreenState();
}

class EntregaEmAndamentoEntregadorScreenState
    extends State<EntregaEmAndamentoEntregadorScreen> {
  TextEditingController group108Controller = TextEditingController();

  TextEditingController group107Controller = TextEditingController();

  TextEditingController group106Controller = TextEditingController();

  TextEditingController exParqueOratorioController = TextEditingController();

  TextEditingController exSantoAndrController = TextEditingController();

  TextEditingController exSPController = TextEditingController();

  TextEditingController exController = TextEditingController();

  TextEditingController group101Controller = TextEditingController();

  TextEditingController exDiretoraController = TextEditingController();

  TextEditingController exCounterController = TextEditingController();

  TextEditingController ninetyEightController = TextEditingController();

  TextEditingController exDiretoraController1 = TextEditingController();

  TextEditingController exCounterController1 = TextEditingController();

  TextEditingController codigoController = TextEditingController();
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
      String nome_fornecedora2 = await fetchFornecedorabyCnpj(widget.remessa?.cnpj_fornecedor);
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
      String nome_transportadora2 = await fetchTransportadorabyCnpj(widget.remessa?.cnpj_transportadora);
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
                                    _buildFinalizaEntrega(context)
                                  ]))))
                    ])),
            bottomNavigationBar: _buildBottomBar(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
  }

  /// Section Widget
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
              title: AppbarSubtitle(text: "Em andamento"),
              actions: [
                AppbarTrailingImage(
                    imagePath: ImageConstant.imgNotification,
                    margin: EdgeInsets.only(left: 34.h, right: 40.h)),
                    Row(
                children: [
                  SizedBox(width: 8.h),
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
  Widget _buildFinalizaEntrega(BuildContext context) {
    return CustomElevatedButton(
        width: 200,
        text: "Finalizar entrega".toUpperCase(),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.labelLarge13_1,
        onPressed: () {
          onTapConfirmarEntrega(context);
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarEntregador(onChanged: (BottomBarEnum type) {});
  }

  /// Common widget
  Widget _buildCargo(
    BuildContext context, {
    required String cargo,
    required String rg,
  }) {
    return Row(children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(cargo,
              style: CustomTextStyles.bodyMediumInter
                  .copyWith(color: appTheme.black900))),
      Padding(
          padding: EdgeInsets.only(left: 126.h),
          child: Text(rg,
              style: CustomTextStyles.bodyMediumInter
                  .copyWith(color: appTheme.black900)))
    ]);
  }

  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the tirarFotoEntregadorScreen when the action is triggered.
  void onTapConfirmarEntrega(BuildContext context) async {
    String codigoDigitado = await _solicitarCodigo(context);
    print(codigoDigitado);
    print(widget.remessa);
    if (codigoDigitado == widget.remessa!.codigo_unico) {
      await _finalizarEntrega(context);
    } else {
      _mostrarErroCodigoIncorreto(context);
    }
  }

  Future<String> _solicitarCodigo(BuildContext context) async {
    return await showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            print("Codigo controler ${codigoController}");
            return AlertDialog(
              title: const Text('Digite o Código de 4 Dígitos'),
              content: TextField(
                controller: codigoController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: const InputDecoration(hintText: "Código"),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Confirmar'),
                  onPressed: () {
                    Navigator.of(context).pop(codigoController.text);
                  },
                ),
              ],
            );
          },
        ) ??
        ''; // Retorna uma string vazia se o diálogo for fechado sem um código
  }

  Future<void> _finalizarEntrega(BuildContext context) async {
    String dataEntregaFinalizada = DateTime.now().toString();
    final String notaFiscal = widget.remessa!.n_nota_fiscal;
    final String statusAtualizado = 'Entregue';
    final apiUrl =
        'http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entrega/$notaFiscal/$statusAtualizado';

    try {
      final response = await http.patch(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'data_entregue': dataEntregaFinalizada}),
      );

      if (response.statusCode == 200) {
        print('Entrega finalizada com sucesso!');
        Navigator.pushNamed(context, AppRoutes.telaPrincipalEntregadorPage);
      }
    } catch (e) {
      print('Erro ao finalizar entrega: $e');
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
    final response = await http
        .get(Uri.parse("http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/fornecedor/${cnpj_fornecedora}"));
    dynamic fornecedora = jsonDecode(response.body);
    fornecedora = Fornecedora.fromJson(fornecedora);
    return fornecedora.nome;
  }

  void _mostrarErroCodigoIncorreto(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Código Incorreto'),
          content: const Text(
              'O código digitado não é válido. Por favor, tente novamente.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
          ],
        );
      },
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
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
            )
          ),
          TextButton(
            onPressed: () {
              logout(context);
              Navigator.of(context).pop();
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

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginTransportadoraScreen(),
      ),
    );
  }
}
