// Importa os pacotes necessários do Flutter
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

// Classe que representa um item da lista de histórico de remessas da escola
class HistoricoderemessasescolaItemWidget extends StatelessWidget {
  const HistoricoderemessasescolaItemWidget({Key? key}) : super(key: key);

  // Constrói a interface do widget
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 18.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgVectorBlack90029x22,
                  height: 24.v,
                  width: 22.h,
                  margin: EdgeInsets.only(bottom: 9.v),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 7.v,
                    bottom: 6.v,
                  ),
                  child: Text(
                    "132345436",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgImage7,
                  height: 31.v,
                  width: 96.h,
                  margin: EdgeInsets.only(top: 3.v),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Text(
              "Dell Computadores",
              style: CustomTextStyles.titleSmallBold,
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Row(
              children: [
                Container(
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  margin: EdgeInsets.only(bottom: 3.v),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      7.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text(
                    "Entregue no prazo",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.img2792947StarXmasIcon,
                  height: 17.v,
                  width: 19.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.h),
                  decoration: AppDecoration.outlineBlack9002,
                  child: Text(
                    "Nota: 5",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3.v),
        ],
      ),
    );
  }
}