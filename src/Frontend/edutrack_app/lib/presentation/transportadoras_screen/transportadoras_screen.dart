import 'package:luis_s_application/widgets/custom_bottom_app_bar_fornecedor.dart';
import '../transportadoras_screen/widgets/transportadoras_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';


class TransportadorasScreen extends StatelessWidget {
  TransportadorasScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildTransportadoras(context),
              SizedBox(height: 21.v),
              _buildTransportadoras1(context),
              SizedBox(height: 31.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildComponentThirtyFive(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  Widget _buildTransportadoras(BuildContext context) {
    return SizedBox(
      height: 52.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.v),
              child: Text(
                "Transportadoras",
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          CustomAppBar(
            height: 52.v,
            leadingWidth: 66.h,
            leading: AppbarLeadingImage(
              imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
              margin: EdgeInsets.only(left: 39.h),
              onTap: () {
                onTapImage(context);
              },
            ),
            centerTitle: true,
            title: AppbarSubtitle(
              text: "Transportadoras",
            ),
            styleType: Style.bgFill,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTransportadoras1(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 20.v,
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return TransportadorasItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildComponentThirtyFive(BuildContext context) {
    return CustomBottomAppBarFornecedor(
      onChanged: (BottomBarEnum type) {},
    );
  }

    onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
