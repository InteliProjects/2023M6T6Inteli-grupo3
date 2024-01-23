import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_dados_tab_container_screen/tela_principal_seduc_escolas_dados_tab_container_screen.dart';

// ignore: must_be_immutable
class TelaprincipalseducescolasItemWidget extends StatelessWidget {
  final Escola escola;
  final VoidCallback onTapComponentVariant;

  const TelaprincipalseducescolasItemWidget({
    Key? key,
    required this.escola,
    required this.onTapComponentVariant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapComponentVariant.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 9.v,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 5.v),
            CustomImageView(
              imagePath: ImageConstant.imgGroup,
              height: 34.v,
              width: 51.h,
            ),
            SizedBox(height: 10.v),
            SizedBox(
              width: 123.h,
              child: Text(
                escola.nome,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.labelMedium_1.copyWith(
                  height: 2.18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
