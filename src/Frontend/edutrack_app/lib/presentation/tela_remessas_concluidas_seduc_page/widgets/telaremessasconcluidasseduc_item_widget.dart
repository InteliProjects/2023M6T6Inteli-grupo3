import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_remessas_concluidas_seduc_page/tela_remessas_concluidas_seduc_page.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class TelaremessasconcluidasseducItemWidget extends StatelessWidget {
  TelaremessasconcluidasseducItemWidget(
      {Key? key,
      this.onTapVerFeedback,
      this.onTapComponent,
      required this.remessa,
      required this.avaliacao,
      required this.avaliacao_media})
      : super(
          key: key,
        );

  VoidCallback? onTapVerFeedback;
  VoidCallback? onTapComponent;
  final Remessa remessa;
  final Avaliacao avaliacao;
  final double avaliacao_media;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapComponent!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 15.v,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 3.v),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 18.h,
                  right: 11.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVectorBlack90029x22,
                      height: 24.v,
                      width: 22.h,
                      margin: EdgeInsets.only(bottom: 10.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.h,
                        top: 7.v,
                        bottom: 5.v,
                      ),
                      child: Text(
                        "${remessa.n_nota_fiscal}",
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
            ),
            SizedBox(height: 13.v),
            Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: Text(
                "${remessa.cnpj_fornecedor}",
                style: CustomTextStyles.titleSmallBold,
              ),
            ),
            SizedBox(height: 8.v),
            Padding(
              padding: EdgeInsets.only(left: 18.h),
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
            SizedBox(height: 6.v),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 18.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.img2792947StarXmasIcon,
                      height: 17.v,
                      width: 19.h,
                      margin: EdgeInsets.symmetric(vertical: 7.v),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 9.h,
                        top: 7.v,
                        bottom: 8.v,
                      ),
                      decoration: AppDecoration.outlineBlack9002,
                      child: Text(
                        "Nota: ${this.avaliacao_media.toStringAsFixed(2)}",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Spacer(),
                    CustomElevatedButton(
                      height: 31.v,
                      width: 131.h,
                      text: "Ver feedback".toUpperCase(),
                      onPressed: () {
                        onTapVerFeedback!.call();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
