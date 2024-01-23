import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class TelaDeRastreioScreen extends StatelessWidget {
  TelaDeRastreioScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          _buildProfile(context),
                          SizedBox(height: 12.v),
                          Padding(
                              padding: EdgeInsets.only(left: 41.h, right: 51.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgComponent98,
                                        height: 153.v,
                                        width: 15.h,
                                        margin: EdgeInsets.only(bottom: 23.v)),
                                    Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 7.h),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Pedido entregue a transportadora",
                                                      style: theme.textTheme
                                                          .titleSmall),
                                                  SizedBox(height: 2.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.h),
                                                      child: Text(
                                                          "21/10/2023  - 14:43",
                                                          style: CustomTextStyles
                                                              .titleSmallBlack900)),
                                                  SizedBox(height: 30.v),
                                                  Text(
                                                      "Pedido saiu para entrega",
                                                      style: theme.textTheme
                                                          .titleSmall),
                                                  SizedBox(height: 2.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.h),
                                                      child: Text(
                                                          "28/10/2023 - 19:43",
                                                          style: CustomTextStyles
                                                              .titleSmallBlack900)),
                                                  SizedBox(height: 30.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.h),
                                                      child: Text(
                                                          "Pedido entregue",
                                                          style: theme.textTheme
                                                              .titleSmall)),
                                                  SizedBox(height: 2.v),
                                                  Text("01/11/2023 ",
                                                      style: CustomTextStyles
                                                          .titleSmallBlack900)
                                                ])))
                                  ]))
                        ])))),
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
        title: AppbarSubtitle(text: "Status"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(40.h, 15.v, 40.h, 13.v))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildProfile(BuildContext context) {
    return SizedBox(
        height: 376.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomRight, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImagemDoWhatsapp,
              height: 319.v,
              width: 360.h,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 19.v)),
          Padding(
              padding: EdgeInsets.only(right: 32.h),
              child: CustomIconButton(
                  height: 38.adaptSize,
                  width: 38.adaptSize,
                  padding: EdgeInsets.all(7.h),
                  alignment: Alignment.bottomRight,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgNavTransporte))),
          Align(
              alignment: Alignment.topCenter,
              child: Text("A caminho", style: theme.textTheme.titleLarge))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the visualizarRemessaScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
