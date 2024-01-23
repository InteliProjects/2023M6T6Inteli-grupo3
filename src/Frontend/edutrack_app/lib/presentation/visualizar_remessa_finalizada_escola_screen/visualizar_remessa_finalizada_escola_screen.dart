import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/avalia_o_da_entrega_escola_dialog/avalia_o_da_entrega_escola_dialog.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_escola.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/presentation/entrega_finalizada_escola_dialog/entrega_finalizada_escola_dialog.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class VisualizarRemessaFinalizadaEscolaScreen extends StatelessWidget {

  final Remessa? remessa;

  VisualizarRemessaFinalizadaEscolaScreen({Key? key, this.remessa}) : super(key: key);

  TextEditingController group220Controller = TextEditingController();

  TextEditingController group221Controller = TextEditingController();

  TextEditingController group219Controller = TextEditingController();

  TextEditingController exCounterController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController exController = TextEditingController();

  TextEditingController exMonitoresController = TextEditingController();

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
              SizedBox(height: 15.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 5.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRemessaDetails(context),
                        SizedBox(height: 20.v),
                        _buildConfirmarEntrega(context),
                        SizedBox(height: 20.v),
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
                }),
            centerTitle: true,
            title: AppbarSubtitle(text: "Dados da remessa"),
            actions: [
              AppbarTrailingImage(
                  imagePath: ImageConstant.imgNotification,
                  margin: EdgeInsets.symmetric(horizontal: 40.h, vertical: 3.v))
            ]));
  }

Widget _buildRemessaDetails(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 15.v),
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Nº Nota Fiscal: ', remessa?.n_nota_fiscal),
            _buildDetailItem('CNPJ Fornecedor: ', remessa?.cnpj_fornecedor),
            _buildDetailItem('CNPJ Transportadora: ', remessa?.cnpj_transportadora),
            _buildDetailItem('CIE Escola: ', remessa?.cie_escola),
            _buildDetailItem('GPB Ger: ', remessa?.gpb_ger),
            _buildDetailItem('Data Estimada Início: ', remessa?.data_estimada_inicio_formatada),
            _buildDetailItem('Data Estimada Fim: ', remessa?.data_estimada_fim_formatada),
            _buildDetailItem('Status Entrega: ', remessa?.status_entrega),
            _buildDetailItem('E-mail Transportadora: ', remessa?.email_usuario_transportadora),
            _buildDetailItem('E-mail Escola: ', remessa?.email_usuario_escola),
            // _buildDetailItem('Data Entregue: ', remessa?.data_entregue_formatada),
            // _buildDetailItem('Prova Entrega: ', remessa?.prova_entrega.toString()),
            _buildDetailItem('Data Criação: ', remessa?.data_criacao_formatada),
            _buildDetailItem('Placa: ', remessa?.placa),
            _buildDetailItem('Valor: ', remessa?.valor.toString()),
            // Adicione mais campos conforme necessário
          ],
        ),
      ),
    );
  }

Widget _buildDetailItem(String label, String? value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.v),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: CustomTextStyles.bodyMediumInter),
        Expanded(
          child: Text(value ?? 'Sem informação', style: CustomTextStyles.bodyMediumInter),
        ),
      ],
    ),
  );
}


Widget _buildConfirmarEntrega(BuildContext context) {
  if (remessa?.status_entrega == 'Entregue') {
    return CustomElevatedButton(
      alignment: Alignment.center,
      width: 214.h,
      text: "Confirmar entrega".toUpperCase(),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1,
      onPressed: () {
        onTapConfirmarEntrega(context, remessa);
      },
    );
  } else {
    return SizedBox.shrink();
  }
}

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarEscola(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the telaPrincipalEscolaScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

onTapConfirmarEntrega(BuildContext context, remessa) async {
  try {
    final String statusAtualizado = 'Concluída';
    final String notaFiscal = remessa!.n_nota_fiscal;
    final apiUrl = 'http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entrega/$notaFiscal/$statusAtualizado';

    final response = await http.patch(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'data_inicio_entrega': null
      }),
    );

    if (response.statusCode == 200) {
      print('Entrega confirmada com sucesso!');

      // Exibe o primeiro modal (EntregaFinalizadaEscolaDialog)
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: EntregaFinalizadaEscolaDialog(),
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.only(left: 0),
          actions: [
            CustomElevatedButton(
              width: 109.h,
              text: "Ok".toUpperCase(),
              buttonStyle: CustomButtonStyles.fillPrimary,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1,
              onPressed: () {
                      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: AvaliaODaEntregaEscolaDialog(remessa: remessa),
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.only(left: 0),
        ),
      );
              },
              alignment: Alignment.center,
            ),
          ],
        ),
      );

      // Aguarda um curto período antes de exibir o segundo modal (AvaliaODaEntregaEscolaDialog)
      await Future.delayed(Duration(milliseconds: 500));

      // Exibe o segundo modal (AvaliaODaEntregaEscolaDialog)
    } else {
      // Handle errors (e.g., show an error message)
      print('Erro ao confirmar entrega: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (e.g., show an error message)
    print('Erro ao confirmar entrega: $e');
  }
}

}
