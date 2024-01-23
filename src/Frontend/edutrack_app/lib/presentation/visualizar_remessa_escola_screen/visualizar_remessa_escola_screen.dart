import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_outlined_button.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class VisualizarRemessaEscolaScreen extends StatelessWidget {
  VisualizarRemessaEscolaScreen({Key? key}) : super(key: key);

  TextEditingController group201Controller = TextEditingController();

  TextEditingController group202Controller = TextEditingController();

  TextEditingController group200Controller = TextEditingController();

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
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fornecedora:",
                                        style:
                                            CustomTextStyles.bodyMediumInter),
                                    SizedBox(height: 4.v),
                                    _buildGroup201(context),
                                    SizedBox(height: 16.v),
                                    Text("Transportadora:",
                                        style:
                                            CustomTextStyles.bodyMediumInter),
                                    SizedBox(height: 3.v),
                                    _buildGroup202(context),
                                    SizedBox(height: 16.v),
                                    Text("Responsável pela entrega:",
                                        style:
                                            CustomTextStyles.bodyMediumInter),
                                    SizedBox(height: 3.v),
                                    _buildGroup200(context),
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
                                    _buildExMonitores1(context)
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
  Widget _buildGroup201(BuildContext context) {
    return CustomTextFormField(
        controller: group201Controller, hintText: "Ex: Yuri carrega tudo");
  }

  /// Section Widget
  Widget _buildGroup202(BuildContext context) {
    return CustomTextFormField(
        controller: group202Controller, hintText: "Ex: Yuri carrega tudo");
  }

  /// Section Widget
  Widget _buildGroup200(BuildContext context) {
    return CustomTextFormField(
        controller: group200Controller,
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
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the telaPrincipalEscolaScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
