import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';

// ignore: must_be_immutable
class TelaprincipalfornecedortwoItemWidget extends StatelessWidget {
  final Remessa remessa;
  final String nome_escola;

  final Map<String, Color> statusColors = {
    'Em andamento': Colors.blue, // Cor desejada para "Em andamento"
    'Entregue': Colors.green, // Cor desejada para "Entregue"
    'Pendente': appTheme.yellowA200, // Cor desejada para "Pendente"
    // Adicione mais cores conforme necessário
  };

  TelaprincipalfornecedortwoItemWidget({
    Key? key,
    required this.remessa,
    required this.nome_escola,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 22.h,
          vertical: 17.v,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgVectorBlack90029x22,
                    height: 29.v,
                    width: 22.h,
                    margin: EdgeInsets.only(bottom: 2.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 3.v,
                      bottom: 6.v,
                    ),
                    child: Text(
                      remessa.n_nota_fiscal,
                      style: theme.textTheme.titleMedium,
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
            SizedBox(height: 12.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                nome_escola,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 10.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                "Entrega estimada: " + remessa.data_estimada_fim_formatada,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Row(
                children: [
                  Container(
                    height: 16.v,
                    width: 17.h,
                    margin: EdgeInsets.only(top: 1.v),
                    decoration: BoxDecoration(
                      color: statusColors[remessa.status_entrega] ?? Colors.grey,
                      borderRadius: BorderRadius.circular(
                        8.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text(
                      remessa.status_entrega,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 13.v),
          ],
        ),
      ),
    );
  }
}
