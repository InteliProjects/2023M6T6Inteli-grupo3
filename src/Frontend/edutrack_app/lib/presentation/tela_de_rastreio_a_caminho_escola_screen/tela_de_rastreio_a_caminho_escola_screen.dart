import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_escola.dart';
import 'package:luis_s_application/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class TelaDeRastreioACaminhoEscolaScreen extends StatelessWidget {
  final Remessa? remessa;

  TelaDeRastreioACaminhoEscolaScreen({
    Key? key,
    this.remessa
    }) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildComponentFiftyTwo(context),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 5.v),
                              child: Column(children: [
                                _buildProfile(context),
                                SizedBox(height: 15.v),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 41.h, right: 51.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgComponent98,
                                              height: 153.v,
                                              width: 15.h,
                                              margin: EdgeInsets.only(
                                                  bottom: 23.v)),
                                          Expanded(
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 7.h),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Pedido entregue a transportadora",
                                                            style: theme
                                                                .textTheme
                                                                .titleSmall),
                                                        SizedBox(height: 2.v),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 1.h),
                                                            child: Text(
                                                                "21/10/2023  - 14:43",
                                                                style: CustomTextStyles
                                                                    .titleSmallBlack900)),
                                                        SizedBox(height: 30.v),
                                                        Text(
                                                            "Pedido saiu para entrega",
                                                            style: theme
                                                                .textTheme
                                                                .titleSmall),
                                                        SizedBox(height: 2.v),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 1.h),
                                                            child: Text(
                                                                "28/10/2023 - 19:43",
                                                                style: CustomTextStyles
                                                                    .titleSmallBlack900)),
                                                        SizedBox(height: 30.v),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 1.h),
                                                            child: Text(
                                                                "Pedido entregue",
                                                                style: theme
                                                                    .textTheme
                                                                    .titleSmall)),
                                                        SizedBox(height: 2.v),
                                                        Text("01/11/2023 ",
                                                            style: CustomTextStyles
                                                                .titleSmallBlack900)
                                                      ])))
                                        ]))
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
            title: AppbarSubtitle(text: "Status"),
            actions: [
              AppbarTrailingImage(
                  imagePath: ImageConstant.imgNotification,
                  margin: EdgeInsets.symmetric(horizontal: 40.h, vertical: 3.v))
            ]));
  }

  /// Section Widget
  Widget _buildProfile(BuildContext context) {
    return SizedBox(
        height: 351.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomRight, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImagemDoWhatsapp,
              height: 319.v,
              width: 360.h,
              alignment: Alignment.topCenter),
          Padding(
              padding: EdgeInsets.only(right: 32.h, bottom: 13.v),
              child: CustomIconButton(
                  height: 38.adaptSize,
                  width: 38.adaptSize,
                  padding: EdgeInsets.all(7.h),
                  alignment: Alignment.bottomRight,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgNavTransporte))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 21.h),
                  child: Text("Pedido: 123456789",
                      style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarEscola(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the visualizarRemessaEscolaScreen when the action is triggered.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
