import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_escola.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/widgets/custom_rating_bar.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';
import 'package:luis_s_application/presentation/entrega_finalizada2_escola_dialog/entrega_finalizada2_escola_dialog.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class AvaliaOEscolaScreen extends StatelessWidget {
  final Remessa? remessa;

  AvaliaOEscolaScreen({Key? key, this.remessa}) : super(key: key);


  TextEditingController feedbackController = TextEditingController();
  RatingController embalagemController = RatingController();
  RatingController materiaisController = RatingController();
  RatingController atendimentoController = RatingController();
  RatingController pontualidadeController = RatingController();


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
              SizedBox(height: 21.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.h, right: 23.h, bottom: 5.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Embalagem?",
                            style: CustomTextStyles.titleLargeBlack900Regular,
                          ),
                        ),

                        CustomRatingBar(controller: embalagemController, initialRating: 0, itemSize: 36),

                        SizedBox(height: 19.v),
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Materiais?",
                            style: CustomTextStyles.titleLargeBlack900Regular,
                          ),
                        ),
                        SizedBox(height: 1.v),
                        CustomRatingBar(controller: materiaisController, initialRating: 0, itemSize: 36),
                        SizedBox(height: 19.v),
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Atendimento?",
                            style: CustomTextStyles.titleLargeBlack900Regular,
                          ),
                        ),
                        SizedBox(height: 1.v),

                        CustomRatingBar(controller: atendimentoController, initialRating: 0, itemSize: 36),

                        SizedBox(height: 19.v),
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Pontualidade?",
                            style: CustomTextStyles.titleLargeBlack900Regular,
                          ),
                        ),
                        SizedBox(height: 1.v),
                        CustomRatingBar(controller: pontualidadeController, initialRating: 0, itemSize: 36),
                        SizedBox(height: 19.v),
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Comentários:",
                            style: CustomTextStyles.bodyMedium_1,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        _buildSixteen(context),
                        SizedBox(height: 26.v),
                        CustomElevatedButton(
                          width: 95.h,
                          text: "Salvar".toUpperCase(),
                          buttonStyle:
                              CustomButtonStyles.fillSecondaryContainerTL18,
                          buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
                          onPressed: () {
                            onTapSalvar(context);
                          },
                          alignment: Alignment.center,
                        )
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

  Widget _buildSixteen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.h),
      child: CustomTextFormField(
        controller: feedbackController,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  /// Section Widget
  Widget _buildComponentFiftyTwo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.v),
      decoration: AppDecoration.fillSecondaryContainer,
      child: CustomAppBar(
        height: 25.v,
        centerTitle: true,
        title: AppbarSubtitle(text: "Avaliação"),
        actions: [
          AppbarTrailingImage(
            imagePath: ImageConstant.imgNotification,
            margin: EdgeInsets.only(left: 40.h, top: 1.v, right: 40.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarEscola(onChanged: (BottomBarEnum type) {});
  }

  /// Displays a dialog with the [EntregaFinalizada2EscolaDialog] content.
  onTapSalvar(BuildContext context) {

  cadastrarAvaliacao(context);
    }

  Future<void> cadastrarAvaliacao(BuildContext context) async {
    
    print("Nota fiscal aqui: " + remessa!.n_nota_fiscal);
    try {
      final response = await http.post(
        Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/avaliacao'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({

              "avaliacao_embalagem": embalagemController.rating.toString(),
              "avaliacao_entregador": atendimentoController.rating.toString(),
              "avaliacao_materiais": materiaisController.rating.toString(),
              "avaliacao_pontualidade": pontualidadeController.rating.toString(),
              "feedback": feedbackController.text,
              "nota_fiscal_entrega": remessa?.n_nota_fiscal,
        }),
      );
      if (response.statusCode == 201) {
        // Avaliação criada com sucesso
        print('Avaliação criada com sucesso!');

        // Adicione um pequeno atraso antes de exibir o diálogo
        await Future.delayed(Duration(milliseconds: 200));

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: EntregaFinalizada2EscolaDialog(),
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.only(left: 0),
          ),
        );
        // Adicione qualquer ação adicional que você deseja realizar após o sucesso
      } else {
        // Erro ao criar a avaliação
        print('Erro ao criar a avaliação: ${response.body}');
        // Trate o erro na interface do usuário conforme necessário
      }
    } catch (e) {
      // Trate exceções, se houver
      print('Erro ao criar a avaliação: $e');
    }
  }
}