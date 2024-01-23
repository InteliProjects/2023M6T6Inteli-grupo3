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
class VisualizarRemessaScreen extends StatelessWidget {
  VisualizarRemessaScreen({Key? key}) : super(key: key);

  TextEditingController group142Controller = TextEditingController();

  TextEditingController group140Controller = TextEditingController();

  TextEditingController group139Controller = TextEditingController();

  TextEditingController exParqueOratorioController = TextEditingController();

  TextEditingController exSantoAndrController = TextEditingController();

  TextEditingController exSPController = TextEditingController();

  TextEditingController exController = TextEditingController();

  TextEditingController group133Controller = TextEditingController();

  TextEditingController group132Controller = TextEditingController();

  TextEditingController exCounterController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController exController1 = TextEditingController();

  TextEditingController exMonitoresController = TextEditingController();

  TextEditingController exCounterController1 = TextEditingController();

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
                  SizedBox(height: 24.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.h, right: 20.h, bottom: 5.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Local:",
                                        style:
                                            CustomTextStyles.bodyMediumInter),
                                    SizedBox(height: 4.v),
                                    _buildGroup142(context),
                                    SizedBox(height: 15.v),
                                    Padding(
                                        padding: EdgeInsets.only(right: 47.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 1.v),
                                                  child: Text("Endereço:",
                                                      style: CustomTextStyles
                                                          .bodyMediumInter)),
                                              Text("N°",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter)
                                            ])),
                                    SizedBox(height: 3.v),
                                    _buildGroup141(context),
                                    SizedBox(height: 15.v),
                                    Text("Bairro:",
                                        style:
                                            CustomTextStyles.bodyMediumInter),
                                    SizedBox(height: 4.v),
                                    _buildExParqueOratorio(context),
                                    SizedBox(height: 15.v),
                                    Text("Cidade:",
                                        style:
                                            CustomTextStyles.bodyMediumInter),
                                    SizedBox(height: 4.v),
                                    _buildExSantoAndr(context),
                                    SizedBox(height: 15.v),
                                    Padding(
                                        padding: EdgeInsets.only(right: 118.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("UF:",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter),
                                              Text("CEP:",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter)
                                            ])),
                                    SizedBox(height: 3.v),
                                    _buildExSP1(context),
                                    SizedBox(height: 16.v),
                                    Text("Transportadora:",
                                        style:
                                            CustomTextStyles.bodyMediumInter),
                                    SizedBox(height: 3.v),
                                    _buildGroup133(context),
                                    SizedBox(height: 16.v),
                                    Text("Responsável pela entrega:",
                                        style:
                                            CustomTextStyles.bodyMediumInter),
                                    SizedBox(height: 3.v),
                                    _buildGroup132(context),
                                    SizedBox(height: 15.v),
                                    Padding(
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
                                            ])),
                                    SizedBox(height: 4.v),
                                    _buildEx346785601(context),
                                    SizedBox(height: 15.v),
                                    Padding(
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
                                            ])),
                                    SizedBox(height: 4.v),
                                    _buildPrice1(context),
                                    SizedBox(height: 15.v),
                                    Padding(
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
                                            ])),
                                    SizedBox(height: 3.v),
                                    _buildExMonitores1(context),
                                    SizedBox(height: 29.v),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 16.h, right: 24.h),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  _buildAtualizar(context),
                                                  _buildRastrear(context)
                                                ]))),
                                    SizedBox(height: 52.v),
                                    _buildDeletar(context)
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
              }
),
            centerTitle: true,
            title: AppbarSubtitle(text: "Remessa 1"),
            actions: [
              AppbarTrailingImage(
                  imagePath: ImageConstant.imgNotification,
                  margin: EdgeInsets.symmetric(horizontal: 40.h, vertical: 3.v))
            ]));
  }

  /// Section Widget
  Widget _buildGroup142(BuildContext context) {
    return CustomTextFormField(
        controller: group142Controller,
        hintText: "Ex: E.E. Prof: José Henrique de Paula ...");
  }

  /// Section Widget
  Widget _buildGroup140(BuildContext context) {
    return Expanded(
        child: CustomTextFormField(
            controller: group140Controller,
            hintText: "Ex: Praça Internacional"));
  }

  /// Section Widget
  Widget _buildGroup139(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: CustomTextFormField(
            width: 65.h, controller: group139Controller, hintText: "597"));
  }

  /// Section Widget
  Widget _buildGroup141(BuildContext context) {
    return Row(children: [_buildGroup140(context), _buildGroup139(context)]);
  }

  /// Section Widget
  Widget _buildExParqueOratorio(BuildContext context) {
    return CustomTextFormField(
        controller: exParqueOratorioController,
        hintText: "Ex: Parque Oratorio");
  }

  /// Section Widget
  Widget _buildExSantoAndr(BuildContext context) {
    return CustomTextFormField(
        controller: exSantoAndrController, hintText: "Ex: Santo André");
  }

  /// Section Widget
  Widget _buildExSP(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 1.v),
        child: CustomTextFormField(
            width: 65.h, controller: exSPController, hintText: "Ex: SP"));
  }

  /// Section Widget
  Widget _buildEx(BuildContext context) {
    return CustomTextFormField(
        width: 150.h, controller: exController, hintText: "Ex: 09250-470");
  }

  /// Section Widget
  Widget _buildExSP1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildExSP(context), _buildEx(context)]);
  }

  /// Section Widget
  Widget _buildGroup133(BuildContext context) {
    return CustomTextFormField(
        controller: group133Controller, hintText: "Ex: Yuri carrega tudo");
  }

  /// Section Widget
  Widget _buildGroup132(BuildContext context) {
    return CustomTextFormField(
        controller: group132Controller,
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
  Widget _buildEx1(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: CustomTextFormField(
                controller: exController1, hintText: "Ex: 26/10/2023")));
  }

  /// Section Widget
  Widget _buildPrice1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildPrice(context), _buildEx1(context)]);
  }

  /// Section Widget
  Widget _buildExMonitores(BuildContext context) {
    return CustomTextFormField(
        width: 216.h,
        controller: exMonitoresController,
        hintText: "Ex: Monitores");
  }

  /// Section Widget
  Widget _buildExCounter1(BuildContext context) {
    return CustomTextFormField(
        width: 65.h,
        controller: exCounterController1,
        hintText: "Ex: 597",
        textInputAction: TextInputAction.done,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 13.v));
  }

  /// Section Widget
  Widget _buildExMonitores1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildExMonitores(context), _buildExCounter1(context)]);
  }

  /// Section Widget
  Widget _buildAtualizar(BuildContext context) {
    return CustomElevatedButton(
        width: 124.h,
        text: "Atualizar".toUpperCase(),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleSmallOnPrimary);
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
  Widget _buildDeletar(BuildContext context) {
    return CustomElevatedButton(
        width: 126.h,
        text: "Deletar".toUpperCase(),
        buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
        buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_2,
        alignment: Alignment.center);
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the telaDeRastreioScreen when the action is triggered.
  onTapRastrear(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.telaDeRastreioScreen);
  }

  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
