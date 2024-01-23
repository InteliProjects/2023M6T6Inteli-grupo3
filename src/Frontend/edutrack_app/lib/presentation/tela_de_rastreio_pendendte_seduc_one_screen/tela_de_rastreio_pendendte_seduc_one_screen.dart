import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class TelaDeRastreioPendendteSeducOneScreen extends StatelessWidget {
  TelaDeRastreioPendendteSeducOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 18.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: _buildTelaDeRastreio(context)))
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
            height: 27.490002.v,
            width: 67.h,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child:
                          Text("Status", style: theme.textTheme.titleLarge))),
            ])),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildTelaDeRastreio(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.h, right: 32.h, bottom: 5.v),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 33.v),
                    child: Text("Pedido: 123456789",
                        style: theme.textTheme.titleSmall)),
                Padding(
                    padding: EdgeInsets.only(bottom: 13.v),
                    child: CustomIconButton(
                        height: 38.adaptSize,
                        width: 38.adaptSize,
                        padding: EdgeInsets.all(7.h),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgNavTransporte)))
              ]),
          SizedBox(height: 15.v),
          Padding(
              padding: EdgeInsets.only(left: 20.h, right: 15.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgComponent98Gray500,
                        height: 153.v,
                        width: 15.h,
                        margin: EdgeInsets.only(bottom: 23.v)),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pedido entregue a transportadora",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 2.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 1.h),
                                      child: Text("21/10/2023  - 14:43",
                                          style: CustomTextStyles
                                              .titleSmallBlack900)),
                                  SizedBox(height: 30.v),
                                  Text("Pedido saiu para entrega",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 2.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 1.h),
                                      child: Text("28/10/2023 - 19:43",
                                          style: CustomTextStyles
                                              .titleSmallBlack900)),
                                  SizedBox(height: 30.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 1.h),
                                      child: Text("Pedido entregue",
                                          style: theme.textTheme.titleSmall)),
                                  SizedBox(height: 2.v),
                                  Text("01/11/2023 ",
                                      style:
                                          CustomTextStyles.titleSmallBlack900)
                                ])))
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the visualizarRemessaEmAndamentoSeducScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
