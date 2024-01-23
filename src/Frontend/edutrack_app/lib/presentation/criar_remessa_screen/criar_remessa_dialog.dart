import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

class CriarRemessaDialog extends StatelessWidget {
  const CriarRemessaDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
        onTap: () {
          onTapNoTitle(context);
        },
        child: Container(
            width: 320.h,
            padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 28.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 23.v),
                  CustomImageView(
                      imagePath: ImageConstant.img3017953Accompl,
                      height: 47.v,
                      width: 48.h),
                  SizedBox(height: 16.v),
                  Text("Remessa Criada com sucesso!".toUpperCase(),
                      style: CustomTextStyles.titleLargeBlack900),
                  SizedBox(height: 23.v),
                  Opacity(
                      opacity: 0.6,
                      child: Container(
                          width: 257.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Text(
                              "Agora você pode acompanhar o status da sua remessa na tela principal da escola ou atualizar o status da remessa."
                                  .toUpperCase(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.labelMediumBlack900
                                  .copyWith(height: 1.60))))
                ])));
  }

  /// Navigates to the telaPrincipalEscolaScreen when the action is triggered.
  onTapNoTitle(BuildContext context) {
    Navigator.pop(context);
  }
}
