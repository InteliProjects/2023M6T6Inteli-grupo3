import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_page/tela_remessas_em_andamento_seduc_page.dart';
// import Remessa;

// ignore: must_be_immutable
class TelaprincipalescolaItemWidget extends StatelessWidget {
  final Remessa? remessa;
  final String? cieEscola;

  final Map<String, Color> statusColors = {
    'Em andamento': Colors.blue, // Cor desejada para "Em andamento"
    'Entregue': Colors.green, // Cor desejada para "Entregue"
    'Pendente': appTheme.yellowA200, // Cor desejada para "Pendente"
    // Adicione mais cores conforme necessário
  };

  TelaprincipalescolaItemWidget({
    Key? key,
    this.remessa,
    this.cieEscola,
    this.onTapComponent,
  }) : super(
          key: key,
        );

  VoidCallback? onTapComponent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapComponent!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 22.h,
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
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, top: 3.v, bottom: 6.v),
                      child: Text(
                        "${remessa?.n_nota_fiscal}",
                        style: theme.textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text(
                      "Cod: ${remessa?.codigo_unico ?? 'Código não disponível'}",
                      style: CustomTextStyles.titleSmallBold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 13.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                "${remessa?.cnpj_fornecedor}",
                style: CustomTextStyles.titleSmallBold,
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                "Entrega Estimada até: ${_formatDate(remessa?.data_estimada_fim)}",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Row(
                children: [
                  Container(
                    height: 15.adaptSize,
                    width: 15.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 1.v),
                    decoration: BoxDecoration(
                      color:
                          statusColors[remessa?.status_entrega] ?? Colors.grey,
                      borderRadius: BorderRadius.circular(
                        7.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Text(
                      "${remessa?.status_entrega}",
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
                  onTapRastrear(context, remessa);
                }),
          ],
        ),
      ),
    );
  }

  onTapRastrear(BuildContext context, Remessa? remessa) {
    switch (remessa?.status_entrega) {
      case "Em andamento":
        Navigator.pushNamed(
          context,
          AppRoutes.telaDeRastreioACaminhoEscolaOneScreen,
          arguments: {
            'n_nota_fiscal': remessa?.n_nota_fiscal ?? 'covas',
            'data_criacao': remessa?.data_criacao ?? 'covas',
            'data_inicio_entrega': remessa?.data_inicio_entrega ?? 'covas',
            'data_entregue': remessa?.data_entregue ?? 'covas',
          },
        );
        break;
      case "Entregue":
        Navigator.pushNamed(
          context,
          AppRoutes.telaDeRastreioEntregueEscolaScreen,
            arguments: {
            'n_nota_fiscal': remessa?.n_nota_fiscal ?? 'covas',
            'data_criacao': remessa?.data_criacao ?? 'covas',
            'data_inicio_entrega': remessa?.data_inicio_entrega ?? 'covas',
            'data_entregue': remessa?.data_entregue ?? 'covas',
          },
        );
        break;
      case "Pendente":
        Navigator.pushNamed(
          context,
          AppRoutes.telaDeRastreioPendendteEscolaScreen,
          arguments: {
            'n_nota_fiscal': remessa?.n_nota_fiscal ?? 'covas',
            'data_criacao': remessa?.data_criacao ?? 'covas',
            'data_inicio_entrega': remessa?.data_inicio_entrega ?? 'covas',
            'data_entregue': remessa?.data_entregue ?? 'covas',
          },
        );
        break;
    }
  }

String _formatDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return 'Data não disponível';
  }

  try {
    final DateTime dateTime = DateFormat('E, dd MMM yyyy HH:mm').parse(dateString);
    return DateFormat('dd/MM/yyyy - HH:mm').format(dateTime);
  } catch (e) {
    // Você pode querer registrar o erro aqui
    return 'Aguardando...';
  }
}
}
