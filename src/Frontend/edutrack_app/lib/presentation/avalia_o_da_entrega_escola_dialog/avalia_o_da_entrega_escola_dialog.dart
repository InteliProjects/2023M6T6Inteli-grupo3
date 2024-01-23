import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/avalia_o_escola_screen/avalia_o_escola_screen.dart';
import 'package:luis_s_application/presentation/entrega_finalizada2_escola_dialog/entrega_finalizada2_escola_dialog.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:http/http.dart' as http;

class AvaliaODaEntregaEscolaDialog extends StatelessWidget {
  final Remessa? remessa;
  const AvaliaODaEntregaEscolaDialog({Key? key, this.remessa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 320.h,
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 14.v),
        decoration: AppDecoration.fillOnPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 224.h,
                      margin: EdgeInsets.only(left: 25.h, right: 32.h),
                      child: Text("O que você achou \nda entrega?",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall))),
              SizedBox(height: 20.v),
              Padding(
                  padding: EdgeInsets.only(right: 13.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                            width: 133.h,
                            text: "Não gostei".toUpperCase(),
                            buttonStyle: CustomButtonStyles.fillRedATL18,
                            buttonTextStyle:
                                CustomTextStyles.titleSmallOnPrimary,
                            onPressed: () {
                              onTapNoGostei(context);
                            }),
                        CustomElevatedButton(
                            width: 94.h,
                            text: "gostei".toUpperCase(),
                            buttonStyle: CustomButtonStyles.fillPrimary,
                            buttonTextStyle:
                                CustomTextStyles.titleSmallOnPrimary,
                            onPressed: () {
                              onTapGostei(context);
                            })
                      ])),
              SizedBox(height: 3.v)
            ]));
  }

  /// Navigates to the avaliaOEscolaScreen when the action is triggered.
onTapNoGostei(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AvaliaOEscolaScreen(remessa: remessa),
    ),
  );
}

  /// Navigates to the telaPrincipalEscolaScreen when the action is triggered.
  onTapGostei(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.telaPrincipalEscolaScreen);
    cadastrarAvaliacao(context);
  }

    Future<void> cadastrarAvaliacao(BuildContext context) async {
    
    print("Nota fiscal aqui: " + remessa!.n_nota_fiscal);
    try {
      final response = await http.post(
        Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/avaliacao'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
              "avaliacao_embalagem": "5",
              "avaliacao_entregador": "5",
              "avaliacao_materiais": "5",
              "avaliacao_pontualidade": "5",
              "feedback": "",
              "nota_fiscal_entrega": remessa?.n_nota_fiscal,
        }),
      );
      
      if (response.statusCode == 201) {
        // Avaliação criada com sucesso
        print('Avaliação criada com sucesso!');

        // Adicione um pequeno atraso antes de exibir o diálogo
        await Future.delayed(Duration(milliseconds: 200));

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: EntregaFinalizada2EscolaDialog(),
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.only(left: 0),
          ),
        );
        // Adicione qualquer ação adicional que você deseja realizar após o sucesso
      } else {
        // Erro ao criar a avaliação
        print('Erro ao criar a avaliação: ${response.body}');
        // Trate o erro na interface do usuário conforme necessário
      }
    } catch (e) {
      // Trate exceções, se houver
      print('Erro ao criar a avaliação: $e');
    }
  }
}
