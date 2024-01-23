import '../perfil_fornecedor_screen/widgets/perfilfornecedor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';

class PerfilFornecedorScreen extends StatelessWidget {
  PerfilFornecedorScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 11.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 20.h,
                      bottom: 10.v,
                    ),
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgInteliInstit,
                          height: 134.v,
                          width: 160.h,
                        ),
                        SizedBox(height: 10.v),
                        Text(
                          "Rafael Tecnico",
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(height: 6.v),
                        _buildWidget(context),
                        SizedBox(height: 5.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.img8Email,
                                  height: 12.v,
                                  width: 18.h,
                                  margin: EdgeInsets.only(
                                    top: 1.v,
                                    bottom: 3.v,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: Text(
                                    "Rafael@tecnico.com",
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 37.v),
                        _buildPerfilFornecedor(context),
                        SizedBox(height: 30.v),
                        _buildComponentFiftyThree(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        }

      ),
      centerTitle: true,
      title: SizedBox(
        height: 31.000004.v,
        width: 56.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 6.v),
                child: Text(
                  "Perfil",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotification,
          margin: EdgeInsets.fromLTRB(40.h, 15.v, 40.h, 13.v),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img352510LocalPhoneIcon,
            height: 16.adaptSize,
            width: 16.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "11 92367-8843",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Spacer(),
          Text(
            "CNPJ: 4533743252/100",
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPerfilFornecedor(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 30.v,
        );
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return PerfilFornecedorItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildComponentFiftyThree(BuildContext context) {
    return Container(
      width: 320.h,
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 13.h),
              child: Text(
                "Avaliação do cliente",
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 13.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgThumbsUp,
                  height: 20.v,
                  width: 23.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 7.v,
                      bottom: 4.v,
                    ),
                    child: Container(
                      height: 10.v,
                      width: 218.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray100,
                        borderRadius: BorderRadius.circular(
                          5.h,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          5.h,
                        ),
                        child: LinearProgressIndicator(
                          value: 0.92,
                          backgroundColor: appTheme.blueGray100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 3.v,
                  ),
                  child: Text(
                    "92%",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              right: 4.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgSearchBlack900,
                  height: 20.v,
                  width: 23.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 4.v,
                      bottom: 6.v,
                    ),
                    child: Container(
                      height: 10.v,
                      width: 218.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray100,
                        borderRadius: BorderRadius.circular(
                          5.h,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          5.h,
                        ),
                        child: LinearProgressIndicator(
                          value: 0.13,
                          backgroundColor: appTheme.blueGray100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            appTheme.black900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    bottom: 2.v,
                  ),
                  child: Text(
                    "8%",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {},
    );
  }

    onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
