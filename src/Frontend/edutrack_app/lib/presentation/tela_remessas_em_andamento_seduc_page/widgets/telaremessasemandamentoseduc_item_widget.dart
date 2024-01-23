import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_page/tela_remessas_em_andamento_seduc_page.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';

// class Remessa {
//   final String n_nota_fiscal;
//   final String gpb_ger;
//   final String data_estimada;
//   final String status_entrega;
//   final String cpf_usuario_transportadora;
//   final String cpf_usuario_escola;
//   final String data_entregue;
//   final String prova_entrega;
//   final String data_criacao;
//   final String placa;

//   Remessa({required this.n_nota_fiscal, required this.gpb_ger, required this.data_estimada, required this.status_entrega, required this.cpf_usuario_transportadora, required this.cpf_usuario_escola, required this.data_entregue, required this.prova_entrega, required this.data_criacao, required this.placa});

// }

// ignore: must_be_immutable
class TelaremessasemandamentoseducItemWidget extends StatelessWidget {
  final Remessa remessa;

  final Map<String, Color> statusColors = {
    'Em andamento': Colors.blue, // Cor desejada para "Em andamento"
    'Entregue': Colors.green, // Cor desejada para "Entregue"
    'Pendente': appTheme.yellowA200, // Cor desejada para "Pendente"
    // Adicione mais cores conforme necessário
  };

  TelaremessasemandamentoseducItemWidget({
    Key? key,
    this.onTapComponent,
    this.onTapRastrear,
    required this.remessa,
  }) : super(
          key: key,
        );

  VoidCallback? onTapComponent;
  VoidCallback? onTapRastrear;
  // Remessa remessa;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapComponent!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 23.h,
          vertical: 15.v,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 6.v),
            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgVectorBlack90029x22,
                    height: 29.v,
                    width: 22.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13.h,
                      top: 3.v,
                      bottom: 6.v,
                    ),
                    child: Text(
                      remessa.n_nota_fiscal,
                      style: theme.textTheme.titleMedium,
                      maxLines: 2,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage7,
                    height: 31.v,
                    width: 96.h,
                  ),
                ],
              ),
            ),
            SizedBox(height: 13.v),
            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: Text(
                remessa.placa,
                style: CustomTextStyles.titleSmallBold,
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: Text(
                "Entrega Estimada: ${remessa.data_estimada_fim_formatada}",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: Row(
                children: [
                  Container(
                    height: 15.adaptSize,
                    width: 15.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 1.v),
                    decoration: BoxDecoration(
                      color: statusColors[remessa.status_entrega] ?? Colors.grey,
                      borderRadius: BorderRadius.circular(
                        7.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Text(
                      remessa.status_entrega,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.v),
            CustomElevatedButton(
              height: 31.v,
              width: 150.h,
              text: "Rastrear".toUpperCase(),
              alignment: Alignment.center,
              onPressed: () {
                onTapRastrear!.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}



