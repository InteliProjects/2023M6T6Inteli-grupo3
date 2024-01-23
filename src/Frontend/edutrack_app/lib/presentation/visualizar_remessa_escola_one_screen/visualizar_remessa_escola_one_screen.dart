import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/widgets/custom_outlined_button.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class VisualizarRemessaEscolaOneScreen extends StatelessWidget {
  VisualizarRemessaEscolaOneScreen({Key? key}) : super(key: key);

  TextEditingController group245Controller = TextEditingController();

  TextEditingController group246Controller = TextEditingController();

  TextEditingController group244Controller = TextEditingController();

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
                child: Column(children: [
                  _buildComponentFiftyTwo(context),
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
                                        style:
                                            CustomTextStyles.bodyMediumInter)),
                                SizedBox(height: 4.v),
                                _buildGroup245(context),
                                SizedBox(height: 16.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Transportadora:",
                                        style:
                                            CustomTextStyles.bodyMediumInter)),
                                SizedBox(height: 3.v),
                                _buildGroup246(context),
                                SizedBox(height: 16.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Responsável pela entrega:",
                                        style:
                                            CustomTextStyles.bodyMediumInter)),
                                SizedBox(height: 3.v),
                                _buildGroup244(context),
                                SizedBox(height: 15.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 71.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("RG:",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter),
                                              Text("Numero NF:",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter)
                                            ]))),
                                SizedBox(height: 4.v),
                                _buildEx346785601(context),
                                SizedBox(height: 15.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 50.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Placa:",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter),
                                              Text("Data estimada:",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter)
                                            ]))),
                                SizedBox(height: 4.v),
                                _buildPrice1(context),
                                SizedBox(height: 15.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 34.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Tipo de produto:",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter),
                                              Text("QTD",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter)
                                            ]))),
                                SizedBox(height: 3.v),
                                _buildExMonitores1(context),
                                SizedBox(height: 39.v),
                                _buildRastrear(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
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
            title: AppbarSubtitle(text: "Remessa 1"),
            actions: [
              AppbarTrailingImage(
                  imagePath: ImageConstant.imgNotification,
                  margin: EdgeInsets.symmetric(horizontal: 40.h, vertical: 3.v))
            ]));
  }

  /// Section Widget
  Widget _buildGroup245(BuildContext context) {
    return CustomTextFormField(
        controller: group245Controller, hintText: "Ex: Yuri carrega tudo");
  }

  /// Section Widget
  Widget _buildGroup246(BuildContext context) {
    return CustomTextFormField(
        controller: group246Controller, hintText: "Ex: Yuri carrega tudo");
  }

  /// Section Widget
  Widget _buildGroup244(BuildContext context) {
    return CustomTextFormField(
        controller: group244Controller,
        hintText: "Ex: Yuri Toledo Martins Vieira");
  }

  /// Section Widget
  Widget _buildEx346785600(BuildContext context) {
    return CustomOutlinedButton(width: 133.h, text: "Ex: 346785600");
  }

  /// Section Widget
  Widget _buildExCounter(BuildContext context) {
    return CustomTextFormField(
        width: 150.h,
        controller: exCounterController,
        hintText: "Ex: 12356434563");
  }

  /// Section Widget
  Widget _buildEx346785601(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildEx346785600(context), _buildExCounter(context)]);
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: CustomTextFormField(
                controller: priceController, hintText: "Ex: BDT-5487")));
  }

  /// Section Widget
  Widget _buildEx(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: CustomTextFormField(
                controller: exController, hintText: "Ex: 26/10/2023")));
  }

  /// Section Widget
  Widget _buildPrice1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildPrice(context), _buildEx(context)]);
  }

  /// Section Widget
  Widget _buildExMonitores(BuildContext context) {
    return CustomTextFormField(
        width: 216.h,
        controller: exMonitoresController,
        hintText: "Ex: Monitores",
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildEx597(BuildContext context) {
    return CustomOutlinedButton(width: 65.h, text: "Ex: 597");
  }

  /// Section Widget
  Widget _buildExMonitores1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildExMonitores(context), _buildEx597(context)]);
  }

  /// Section Widget
  Widget _buildRastrear(BuildContext context) {
    return CustomElevatedButton(
        width: 110.h,
        text: "Rastrear".toUpperCase(),
        buttonStyle: CustomButtonStyles.fillSecondaryContainerTL18,
        buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryBold,
        onPressed: () {
          onTapRastrear(context);
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the telaPrincipalEscolaScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the telaDeRastreioACaminhoEscolaOneScreen when the action is triggered.
  onTapRastrear(BuildContext context) {
    Navigator.pushNamed(
        context, AppRoutes.telaDeRastreioACaminhoEscolaOneScreen);
  }
}
