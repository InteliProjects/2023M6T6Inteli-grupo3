import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/avalia_o_da_entrega_escola_dialog/avalia_o_da_entrega_escola_dialog.dart';

class EntregaFinalizadaEscolaDialog extends StatelessWidget {
  const EntregaFinalizadaEscolaDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
        onTap: () {
          onTapNoTitle(context);
        },
        child: Container(
            width: 320.h,
            padding: EdgeInsets.symmetric(horizontal: 39.h, vertical: 29.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 21.v),
                  CustomImageView(
                      imagePath: ImageConstant.img3017953Accompl,
                      height: 47.v,
                      width: 48.h),
                  SizedBox(height: 16.v),
                  Text("Entrega recebida!".toUpperCase(),
                      style: CustomTextStyles.titleLargeBlack900),
                  SizedBox(height: 21.v),
                  Opacity(
                      opacity: 0.6,
                      child: Container(
                          width: 224.h,
                          margin: EdgeInsets.only(left: 9.h, right: 8.h),
                          child: Text(
                              "Parabéns, você acabou de receber mais uma entrega!"
                                  .toUpperCase(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.labelLargeBlack900
                                  .copyWith(height: 1.33))))
                ])));
  }

  /// Displays a dialog with the [AvaliaODaEntregaEscolaDialog] content.
  onTapNoTitle(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: AvaliaODaEntregaEscolaDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
