import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/entrega_em_andamento_entregador_screen/entrega_em_andamento_entregador_screen.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:http/http.dart' as http;
// import 'package:luis_s_application/routes/app_routes.dart';

// ignore: must_be_immutable
class TelaprincipalentregadorItemWidget extends StatelessWidget {
  final Remessa remessa;
  final String nome_escola;
  final String endereco;
  final String numero;
  final String bairro;
  final String cep;

  TelaprincipalentregadorItemWidget({
    Key? key,
    required this.remessa,
    required this.nome_escola,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.cep,
    
  }) : super(
          key: key,
        );


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                ],
              ),
            ),
            SizedBox(height: 12.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                "Escola: " + nome_escola,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 11.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                "Endereço: " + endereco + ', ' + numero,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 8.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                "Bairro: " + bairro,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 15.v),
            _buildIniciarEntrega(context)
          ],
        ),
      ),
    );
  }

  Widget _buildIniciarEntrega(BuildContext context) {
  if (remessa.status_entrega == 'Pendente') {
    return CustomElevatedButton(
      alignment: Alignment.center,
      width: 214.h,
      text: "Iniciar entrega".toUpperCase(),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1,
      onPressed: () {
        onTapIniciarEntrega(context, remessa);
      },
    );
  } else {
    return SizedBox.shrink();
  }
}

  onTapIniciarEntrega(BuildContext context, remessa) async {
  try {
    String dataInicioAtual = DateTime.now().toString();
    final String notaFiscal = remessa.n_nota_fiscal;
    final String statusAtualizado = 'Em%20andamento';
    final apiUrl = 'http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entrega/$notaFiscal/$statusAtualizado';

    final response = await http.patch(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'data_inicio_entrega': dataInicioAtual
      }),
    );

    if (response.statusCode == 200) {
      print('Entrega iniciada com sucesso!');
      Navigator.push(
      context,
       MaterialPageRoute(builder: (context) => EntregaEmAndamentoEntregadorScreen(remessa: remessa)));
              };
  } catch (e) {
    print('Erro ao iniciar entrega: $e');
  }
}

}

