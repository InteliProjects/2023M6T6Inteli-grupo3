import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/presentation/entrega_finalizada_entregador_dialog/entrega_finalizada_entregador_dialog.dart';

class SalvarFotoEntregadorScreen extends StatelessWidget {
  const SalvarFotoEntregadorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.v),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Spacer(flex: 57),
                  _buildNoTitle(context),
                  Spacer(flex: 42),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 112.h),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgComponent92,
                            height: 79.adaptSize,
                            width: 79.adaptSize),
                        SizedBox(height: 18.v),
                        Text("Tirar foto",
                            style: CustomTextStyles.titleLargeBlack900_1)
                      ]))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 69.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
            margin: EdgeInsets.only(left: 39.h, top: 12.v, bottom: 10.v),
            onTap: () {
              onTapImage(context);
            }),
        centerTitle: true,
        title: SizedBox(
            height: 27.v,
            width: 150.h,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              AppbarSubtitle(
                  text: "Registrar nota", margin: EdgeInsets.only(bottom: 2.v)),
              AppbarSubtitle(
                  text: "Registrar nota", margin: EdgeInsets.only(top: 2.v))
            ])),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(40.h, 15.v, 40.h, 13.v))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildNoTitle(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v),
        decoration: AppDecoration.outlineBlack9001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Text("Salvar imagem?",
                  style: CustomTextStyles.titleSmallBlack900Medium),
              SizedBox(height: 21.v),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomElevatedButton(
                                height: 29.v,
                                width: 73.h,
                                text: "Não".toUpperCase(),
                                buttonStyle: CustomButtonStyles.fillRedA,
                                buttonTextStyle:
                                    CustomTextStyles.labelLarge13_1,
                                onPressed: () {
                                  onTapNo(context);
                                }),
                            CustomElevatedButton(
                                height: 29.v,
                                width: 73.h,
                                text: "Sim".toUpperCase(),
                                buttonTextStyle:
                                    CustomTextStyles.labelLarge13_1,
                                onPressed: () {
                                  onTapSim(context);
                                })
                          ])))
            ]));
  }

  /// Navigates to the entregaEmAndamentoEntregadorScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the tirarFotoEntregadorScreen when the action is triggered.
  onTapNo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.tirarFotoEntregadorScreen);
  }

  /// Displays a dialog with the [EntregaFinalizadaEntregadorDialog] content.
  onTapSim(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: EntregaFinalizadaEntregadorDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
