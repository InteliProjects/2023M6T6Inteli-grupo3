import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

// ignore: must_be_immutable
class PerfilTransportadoraItemWidget extends StatelessWidget {
  const PerfilTransportadoraItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 105.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Text(
            "Entregas feita:",
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 3.v),
          Text(
            "23/30",
            style: theme.textTheme.displayMedium,
          ),
          SizedBox(height: 1.v),
          CustomImageView(
            imagePath: ImageConstant.imgCheckmark,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ],
      ),
    );
  }
}
