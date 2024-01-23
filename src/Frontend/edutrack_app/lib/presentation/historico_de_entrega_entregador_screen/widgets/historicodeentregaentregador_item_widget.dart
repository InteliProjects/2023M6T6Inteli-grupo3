import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class HistoricodeentregaentregadorItemWidget extends StatelessWidget {
  const HistoricodeentregaentregadorItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.h),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 6.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 17.h,
                right: 9.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgVectorBlack90029x22,
                    height: 26.v,
                    width: 22.h,
                    margin: EdgeInsets.only(bottom: 2.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 3.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "132345436",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage7,
                    height: 28.v,
                    width: 96.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: Text(
              "E.E. Prof José H. de Paula e Silva",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: Text(
              "Entregue: 23/09/2023",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: Row(
              children: [
                Container(
                  height: 15.v,
                  width: 17.h,
                  margin: EdgeInsets.only(bottom: 3.v),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      8.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "Entregue",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img2792947StarXmasIcon,
                    height: 17.v,
                    width: 19.h,
                    margin: EdgeInsets.only(
                      top: 9.v,
                      bottom: 4.v,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 6.h,
                      top: 9.v,
                      bottom: 7.v,
                    ),
                    decoration: AppDecoration.outlineBlack9002,
                    child: Text(
                      "Nota: 4",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    height: 31.v,
                    width: 131.h,
                    text: "Ver feedback".toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
