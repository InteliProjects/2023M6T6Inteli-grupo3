import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CadastroTransportadorasScreen extends StatelessWidget {
  CadastroTransportadorasScreen({Key? key}) : super(key: key);

  TextEditingController eightController = TextEditingController();

  TextEditingController sevenController = TextEditingController();

  TextEditingController sixController = TextEditingController();

  TextEditingController exParqueOratorioController = TextEditingController();

  TextEditingController exController = TextEditingController();

  TextEditingController exController1 = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 24.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 19.h, right: 19.h, bottom: 5.v),
                              child: Column(children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Nome:",
                                        style:
                                            CustomTextStyles.bodyMediumInter)),
                                SizedBox(height: 4.v),
                                _buildEight(context),
                                SizedBox(height: 15.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
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
                                            ]))),
                                SizedBox(height: 3.v),
                                _buildSeven1(context),
                                SizedBox(height: 15.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Bairro:",
                                        style:
                                            CustomTextStyles.bodyMediumInter)),
                                SizedBox(height: 4.v),
                                _buildExParqueOratorio(context),
                                SizedBox(height: 15.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 110.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 1.v),
                                                  child: Text("CEP:",
                                                      style: CustomTextStyles
                                                          .bodyMediumInter)),
                                              Text("CNPJ:",
                                                  style: CustomTextStyles
                                                      .bodyMediumInter)
                                            ]))),
                                SizedBox(height: 2.v),
                                _buildEx2(context),
                                SizedBox(height: 60.v),
                                _buildCadastrar(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
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
            height: 24.999996.v,
            width: 102.h,
            child: Stack(alignment: Alignment.center, children: [
              AppbarSubtitle(text: "Cadastrar"),
              AppbarSubtitle(text: "Cadastrar")
            ])),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(40.h, 15.v, 40.h, 13.v))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return CustomTextFormField(
        controller: eightController,
        hintText: "Ex: E.E. Prof: José Henrique de Paula ...");
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Expanded(
        child: CustomTextFormField(
            controller: sevenController, hintText: "Ex: Praça Internacional"));
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 22.h),
        child: CustomTextFormField(
            width: 65.h, controller: sixController, hintText: "597"));
  }

  /// Section Widget
  Widget _buildSeven1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildSeven(context), _buildSix(context)]);
  }

  /// Section Widget
  Widget _buildExParqueOratorio(BuildContext context) {
    return CustomTextFormField(
        controller: exParqueOratorioController,
        hintText: "Ex: Parque Oratorio");
  }

  /// Section Widget
  Widget _buildEx(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 10.h, bottom: 1.v),
            child: CustomTextFormField(
                controller: exController, hintText: "Ex: 09250-470")));
  }

  /// Section Widget
  Widget _buildEx1(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: CustomTextFormField(
                controller: exController1,
                hintText: "Ex: 09250-470",
                textInputAction: TextInputAction.done)));
  }

  /// Section Widget
  Widget _buildEx2(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildEx(context), _buildEx1(context)]);
  }

  /// Section Widget
  Widget _buildCadastrar(BuildContext context) {
    return CustomElevatedButton(
        height: 39.v,
        width: 150.h,
        text: "Cadastrar".toUpperCase(),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
        onPressed: () {
          onTapCadastrar(context);
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the transportadorasScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the transportadorasScreen when the action is triggered.
  onTapCadastrar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.transportadorasScreen);
  }
}
