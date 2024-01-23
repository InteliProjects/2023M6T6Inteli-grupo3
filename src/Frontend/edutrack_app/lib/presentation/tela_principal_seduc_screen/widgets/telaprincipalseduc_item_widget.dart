import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_screen/tela_principal_seduc_screen.dart';

// Modificação para aceitar dados da diretoria
class TelaprincipalseducItemWidget extends StatelessWidget {
  final Diretoria diretoria; // Adicionando um objeto Diretoria

  const TelaprincipalseducItemWidget({
    Key? key,
    required this.diretoria, // Requerindo a diretoria como um parâmetro
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center, // Alinhar os filhos verticalmente ao centro
        children: [
          Align( // Usando Align para centralizar a imagem
            alignment: Alignment.center,
            child: CustomImageView(
              imagePath: ImageConstant.imgVectorBlack90035x44,
              height: 35.v,
              width: 44.h,
            ),
          ),
          SizedBox(height: 5.v), // Espaço entre a imagem e o texto
          SizedBox(
            width: 121.h,
            child: Text(
              diretoria.nome,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.labelMedium_1.copyWith(
                height: 2.18,
              ),
            ),
          ),
          SizedBox(height: 5.v), // Espaço após o texto
        ],
      ),
    );
  }
}