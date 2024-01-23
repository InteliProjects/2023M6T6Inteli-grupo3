// Importa os pacotes necessários do Flutter
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_rating_bar.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';

// Ignora avisos relacionados à imutabilidade
// ignore_for_file: must_be_immutable
class TelaDeFeedbackEntregueSeducTwoScreen extends StatelessWidget {
  TelaDeFeedbackEntregueSeducTwoScreen({Key? key}) : super(key: key);

  // Controlador de texto para a caixa de comentários
  TextEditingController group331Controller = TextEditingController();

  // Chave global para o estado do navegador
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // Constrói a interface da tela
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Barra de aplicativo personalizada
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 21.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 5.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título "Embalagem"
                        Text(
                          "Embalagem:",
                          style: CustomTextStyles.titleLargeBlack900Regular,
                        ),
                        SizedBox(height: 12.v),
                        // Barra de classificação personalizada
                        CustomRatingBar(initialRating: 5),
                        SizedBox(height: 14.v),
                        // Título "Materiais"
                        Text(
                          "Materiais:",
                          style: CustomTextStyles.titleLargeBlack900Regular,
                        ),
                        SizedBox(height: 14.v),
                        // Imagem personalizada
                        CustomImageView(
                          imagePath: ImageConstant.imgComponent159,
                          height: 27.v,
                          width: 234.h,
                        ),
                        SizedBox(height: 14.v),
                        // Título "Atendimento"
                        Text(
                          "Atendimento:",
                          style: CustomTextStyles.titleLargeBlack900Regular,
                        ),
                        SizedBox(height: 14.v),
                        // Barra de classificação personalizada
                        CustomRatingBar(initialRating: 5),
                        SizedBox(height: 96.v),
                        // Título "Comentários"
                        Text(
                          "Comentários:",
                          style: CustomTextStyles.titleLargeBlack900Regular,
                        ),
                        SizedBox(height: 5.v),
                        // Caixa de texto personalizada
                        CustomTextFormField(
                          controller: group331Controller,
                          hintText:
                              "Entregador muito educado e cordial. Único ponto é que um dos computadores veio com uma tecla solta do teclado.",
                          textInputAction: TextInputAction.done,
                          maxLines: 6,
                          contentPadding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 16.v),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Barra de navegação inferior personalizada
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Seção Widget para construir a barra de aplicativo personalizada
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
        margin: EdgeInsets.only(left: 39.h, top: 12.v, bottom: 10.v),
        // Ação ao tocar na imagem da barra de navegação
        onTap: () {
          onTapImage(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitle(text: "Feedback 1"),
      styleType: Style.bgFill,
    );
  }

  /// Seção Widget para construir a barra de navegação inferior
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {},
    );
  }

  /// Navega até a tela historicoDeRemessasEscolaScreen quando a ação é acionada.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
