// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_remessas_concluidas_seduc_page/tela_remessas_concluidas_seduc_page.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_seduc.dart';
import 'package:luis_s_application/widgets/custom_rating_bar.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';

class TelaDeFeedbackEntregueSeducScreen extends StatelessWidget {
  final Avaliacao? avaliacao;

  TelaDeFeedbackEntregueSeducScreen({Key? key, this.avaliacao})
      : super(
          key: key,
        );

  TextEditingController group324Controller = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: _buildFeedbackContent(context, avaliacao!),
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildFeedbackContent(BuildContext context, Avaliacao avaliacao) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(height: 21.v),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                  right: 20.h,
                  bottom: 5.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Embalagem:",
                      style: CustomTextStyles.titleLargeBlack900Regular,
                    ),
                    SizedBox(height: 12.v),
                    CustomRatingBar(
                      initialRating: avaliacao.embalagem, // Dados da API
                    ),
                    SizedBox(height: 14.v),
                    Text(
                      "Materiais:",
                      style: CustomTextStyles.titleLargeBlack900Regular,
                    ),
                    SizedBox(height: 14.v),
                    CustomRatingBar(
                      initialRating: avaliacao.materiais, // Dados da API
                    ),
                    SizedBox(height: 14.v),
                    Text(
                      "Atendimento:",
                      style: CustomTextStyles.titleLargeBlack900Regular,
                    ),
                    SizedBox(height: 14.v),
                    CustomRatingBar(
                      initialRating: avaliacao.atendimento, // Dados da API
                    ),
                    SizedBox(height: 55.v),
                    Text(
                      "Comentários:",
                      style: CustomTextStyles.titleLargeBlack900Regular,
                    ),
                    SizedBox(height: 5.v),
                    _buildFeedback(context),
                    SizedBox(height: 5.v),
                    // CustomTextFormField(
                    //   controller: TextEditingController(text: avaliacao.feedback),
                    //   textInputAction: TextInputAction.done,
                    //   maxLines: 6,
                    //   contentPadding: EdgeInsets.symmetric(
                    //     horizontal: 17.h,
                    //     vertical: 16.v,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
          margin: EdgeInsets.only(
            left: 39.h,
            top: 12.v,
            bottom: 10.v,
          ),
          onTap: () {
            onTapImage(context);
          }),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Feedback",
      ),
      styleType: Style.bgFill,
    );
  }

  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarSeduc(
      onChanged: (BottomBarEnum type) {},
    );
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

  Widget _buildFeedback(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width - 40, // Exemplo de largura limitada
      child: _buildTextFormField(avaliacao?.feedback),
    );
  }
}
