import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

// ignore: must_be_immutable
class TransportadorasItemWidget extends StatelessWidget {
  const TransportadorasItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage7,
                  height: 28.v,
                  width: 96.h,
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.img2792947StarXmasIcon,
                  height: 17.v,
                  width: 19.h,
                  margin: EdgeInsets.only(
                    top: 5.v,
                    bottom: 6.v,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 6.h,
                    top: 6.v,
                    bottom: 11.v,
                  ),
                  decoration: AppDecoration.outlineBlack9002,
                  child: Text(
                    "Nota: 4",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text(
              "CNPJ: 23412515-76",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.img352510LocalPhoneIcon,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.only(bottom: 2.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.h),
                  child: Text(
                    "11 94523-8765",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.img8Email,
                  height: 12.v,
                  width: 18.h,
                  margin: EdgeInsets.only(
                    top: 3.v,
                    bottom: 1.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "jadlog@gamil.com",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.v),
        ],
      ),
    );
  }
}
