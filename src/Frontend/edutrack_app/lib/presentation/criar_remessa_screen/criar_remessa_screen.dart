import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_principal_fornecedortwo_page/tela_principal_fornecedortwo_page.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_fornecedor.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';
import 'package:luis_s_application/presentation/criar_remessa_screen/criar_remessa_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// ignore_for_file: must_be_immutable
class CriarRemessaScreen extends StatefulWidget {
  CriarRemessaScreen({Key? key}) : super(key: key);

  @override
  CriarRemessaScreenState createState() => CriarRemessaScreenState();
}

class CriarRemessaScreenState extends State<CriarRemessaScreen> {
  late String data_estimada_inicio;
  late String data_estimada_fim;
  late String data_criacao;
  late String data_entregue;
  late String cie_escola;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController sixteenController = TextEditingController();
  TextEditingController fifteenController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController cnpjTransportadoraController = TextEditingController();
  TextEditingController dataCriacaoController = TextEditingController();
  // TextEditingController dataEntregueController = TextEditingController();
  TextEditingController dataEstimadaInicioController = TextEditingController();
  TextEditingController dataEstimadaFimController = TextEditingController();
  TextEditingController tipoProdutoController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController emailUsuarioTransportadoraController =
      TextEditingController();
  TextEditingController emailUsuarioEscolaController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildComponentFiftyTwo(context),
              SizedBox(height: 25.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.h, right: 20.h, bottom: 5.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Dados sobre a entrega:",
                            style: CustomTextStyles.titleLargeInterBlack900,
                          ),
                        ),
                        SizedBox(height: 28.v),
                        Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text(
                            "CIE da Escola:",
                            style: CustomTextStyles.bodyMediumInter,
                          ),
                        ),
                        SizedBox(height: 3.v),
                        _buildSixteen(context),
                        SizedBox(height: 16.v),
                        Text(
                          "Nota fiscal:",
                          style: CustomTextStyles.bodyMediumInter,
                        ),
                        SizedBox(height: 3.v),
                        _buildFifteen(context),
                        SizedBox(height: 15.v),
                        Text(
                          "Placa:",
                          style: CustomTextStyles.bodyMediumInter,
                        ),
                        SizedBox(height: 3.v),
                        _buildPlaca(context),
                        SizedBox(height: 15.v),
                        Padding(
                          padding: EdgeInsets.only(right: 70.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Produto:"),
                                Text("Quantidade: "),
                              ]),
                        ),

                        // SizedBox(height: 3.v),
                        SizedBox(height: 3.v),
                        _buildExCounter2(context),
                        SizedBox(height: 15.v),
                        Text("Email Transportadora:"),
                        SizedBox(height: 3.v),
                        _buildEmailUsuarioTransportadora(context),
                        SizedBox(height: 15.v),
                        Text("Email Escola:"),
                        SizedBox(height: 3.v),
                        _buildEmailUsuarioEscola(context),
                        SizedBox(height: 15.v),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 36.v,
                            width: 150.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 41.h),
                                    child: Text(
                                      "Cadastrar",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ),
                                ),
                                _buildCadastrar(context),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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

  /// Section Widget
  Widget _buildComponentFiftyTwo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.v),
      decoration: AppDecoration.fillSecondaryContainer,
      child: CustomAppBar(
        height: 30.v,
        leadingWidth: 69.h,
        leading: AppbarLeadingImage(
          imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
          margin: EdgeInsets.only(left: 39.h),
          onTap: () {
            onTapImage(context);
          },
        ),
        centerTitle: true,
        title: AppbarSubtitle(text: "Criar remessa"),
      ),
    );
  }

  /// Section Widget
  Widget _buildSixteen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: CustomTextFormField(
        controller: sixteenController,
        hintText: "Ex: 100110",
      ),
    );
  }

  /// Section Widget
  Widget _buildFifteen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: CustomTextFormField(
        controller: fifteenController,
        hintText: "Ex: 12.341.2456789-10",
      ),
    );
  }

  /// Section Widget
  Widget _buildPlaca(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: CustomTextFormField(
        controller: placaController,
        hintText: "Ex: ABC-1234",
      ),
    );
  }

  /// Section Widget
  Widget _buildExCounter(BuildContext context) {
    return CustomTextFormField(
      controller: cnpjTransportadoraController,
      hintText: "Ex: 01.604.4700001-27",
    );
  }

  /// Section Widget
  Widget _buildExCounter2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildPrice1(context),
          SizedBox(height: 15.v),
          Text("Valor:"),
          SizedBox(height: 3.v),
          _buildValor(context),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              "CNPJ Transportadora:",
              style: CustomTextStyles.bodyMediumInter,
            ),
          ),
          SizedBox(height: 3.v),
          _buildExCounter(context),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              "Data estimada início e fim:",
              style: CustomTextStyles.bodyMediumInter,
            ),
          ),
          SizedBox(height: 3.v),
          _buildDatePicker(context, dataEstimadaInicioController,
              "Data estimada início:", "data_estimada_inicio"),
          SizedBox(height: 15.v),
          _buildDatePicker(context, dataEstimadaFimController,
              "Data estimada fim:", "data_estimada_fim"),
          SizedBox(height: 15.v),
        ],
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context,
      TextEditingController controller, String labelText, String dataType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 1.h),
          child: Text(
            labelText,
            style: CustomTextStyles.bodyMediumInter,
          ),
        ),
        SizedBox(height: 3.v),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );

            if (pickedDate != null) {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (pickedTime != null) {
                DateTime pickedDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute);
                String formattedDateTime =
                    DateFormat('dd/MM/yyyy HH:mm').format(pickedDateTime);
                controller.text = formattedDateTime;

                setState(() {}); // Atualiza a interface do usuário
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.text != 'null'
                    ? Text(controller.text)
                    : Text(
                        "Selecionar Data e Hora",
                        style: TextStyle(fontSize: 16.0),
                      ),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String formatarDataHora(DateTime dataHora) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dataHora);
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10.h),
        child: CustomTextFormField(
          controller: tipoProdutoController,
          hintText: "Ex: Monitores",
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEx(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10.h),
        child: CustomTextFormField(
          controller: quantidadeController,
          hintText: "Ex: 200",
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPrice1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPrice(context),
        _buildEx(context),
      ],
    );
  }

  Widget _buildEmailUsuarioTransportadora(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: CustomTextFormField(
        controller: emailUsuarioTransportadoraController,
        hintText: "E-mail da Transportadora",
      ),
    );
  }

  Widget _buildEmailUsuarioEscola(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: CustomTextFormField(
        controller: emailUsuarioEscolaController,
        hintText: "E-mail da Escola",
      ),
    );
  }

  Widget _buildValor(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: CustomTextFormField(
        controller: valorController,
        hintText: "Valor",
      ),
    );
  }

  Widget _buildCadastrar(BuildContext context) {
    return CustomElevatedButton(
      width: 150.h,
      text: "Cadastrar".toUpperCase(),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 5.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgFloatingIcon,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillSecondaryContainerTL18,
      buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1,
      alignment: Alignment.center,
      onPressed: () {
        cadastrarRemessa(context);
      },
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarFornecedor(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the criarRemessaScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> cadastrarRemessa(BuildContext context) async {
    try {
      print("Vou tentar");
      DateTime dataEstimadaInicio = DateFormat('dd/MM/yyyy HH:mm')
          .parse(dataEstimadaInicioController.text);
      DateTime dataEstimadaFim =
          DateFormat('dd/MM/yyyy HH:mm').parse(dataEstimadaFimController.text);
      print("Fiz os DateTime");

      String dataEstimadaInicioIso =
          DateFormat('yyyy-MM-ddTHH:mm').format(dataEstimadaInicio);
      String dataEstimadaFimIso =
          DateFormat('yyyy-MM-ddTHH:mm').format(dataEstimadaFim);
      print("voltou para string");
      final response = await http.post(
        Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entrega'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "n_nota_fiscal": fifteenController.text,
          "cnpj_fornecedor": "00.369.6460001-40",
          "cnpj_transportadora": cnpjTransportadoraController.text,
          "cie_escola": sixteenController.text,
          "gpb_ger": "100587",
          "data_estimada_inicio": dataEstimadaInicioIso,
          "data_estimada_fim": dataEstimadaFimIso,
          "status_entrega": "Pendente",
          "email_usuario_transportadora":
              emailUsuarioTransportadoraController.text,
          "email_usuario_escola": emailUsuarioEscolaController.text,
          "data_entregue": null,
          "prova_entrega": true,
          "data_criacao": DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime
              .now()), // OBS(Vitor): posso deixar a data atual: DateTime.now().toString() ou "${DateTime.now()}" também.
          "placa": placaController.text,
          "valor": double.parse(valorController.text),
        }),
      );
      print("FIZ A REQ PPRT");

      if (response.statusCode == 201) {
        // Entrega criada com sucesso
        print('Entrega criada com sucesso!');
        await showDialog(
          context:
              context, // Use o contexto passado como parâmetro para o método
          builder: (_) => AlertDialog(
            content: CriarRemessaDialog(),
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.only(left: 0),
          ),
        );

        // Adicione um pequeno atraso antes de exibir o diálogo
        await Future.delayed(Duration(milliseconds: 200));

        // Adicione qualquer ação adicional que você deseja realizar após o sucesso
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TelaPrincipalFornecedortwoPage(),
        ),
      );
      } else {
        // Erro ao criar a entrega
        print('Erro ao criar a entrega: ${response.body}');
        // Trate o erro na interface do usuário conforme necessário
      }
    } catch (e) {
      // Trate exceções, se houver
      print('Erro ao criar a entrega: $e');
    }
  }

}
