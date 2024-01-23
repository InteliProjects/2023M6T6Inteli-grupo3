import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

// ignore_for_file: must_be_immutable
class EntregaFinalizadaEntregadorDialog extends StatelessWidget {
  const EntregaFinalizadaEntregadorDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 320.h,
      padding: EdgeInsets.symmetric(
        horizontal: 32.h,
        vertical: 29.v,
      ),
      decoration: AppDecoration.fillOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 21.v),
          CustomImageView(
            imagePath: ImageConstant.img3017953Accompl,
            height: 47.v,
            width: 48.h,
          ),
          SizedBox(height: 16.v),
          Text(
            "Entrega finalizada".toUpperCase(),
            style: CustomTextStyles.titleLargeBlack900,
          ),
          SizedBox(height: 21.v),
          Opacity(
            opacity: 0.6,
            child: Container(
              width: 250.h,
              margin: EdgeInsets.only(
                left: 3.h,
                right: 2.h,
              ),
              child: Text(
                "Parabéns, você concluiu mais uma entrega!".toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.labelLargeBlack900.copyWith(
                  height: 1.33,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
