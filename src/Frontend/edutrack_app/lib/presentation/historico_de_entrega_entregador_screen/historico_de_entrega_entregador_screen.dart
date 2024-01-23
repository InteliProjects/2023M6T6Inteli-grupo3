import '../historico_de_entrega_entregador_screen/widgets/historicodeentregaentregador_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';

class HistoricoDeEntregaEntregadorScreen extends StatelessWidget {
  HistoricoDeEntregaEntregadorScreen({Key? key})
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
              _buildComponentFiftyTwo(context),
              SizedBox(height: 21.v),
              _buildHistoricodeentregaEntregador(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  Widget _buildComponentFiftyTwo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.v),
      decoration: AppDecoration.fillSecondaryContainer,
      child: CustomAppBar(
        height: 25.v,
        centerTitle: true,
        title: AppbarSubtitle(
          text: "Histórico",
        ),
        actions: [
          AppbarTrailingImage(
            imagePath: ImageConstant.imgNotification,
            margin: EdgeInsets.only(
              left: 40.h,
              top: 1.v,
              right: 40.h,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHistoricodeentregaEntregador(BuildContext context) {
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
          itemCount: 4,
          itemBuilder: (context, index) {
            return HistoricodeentregaentregadorItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}
