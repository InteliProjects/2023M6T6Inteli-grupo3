import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HistoricoderemessasItemWidget extends StatelessWidget {
  final Remessa? remessa;
  final String? cieEscola;
  final String? notaFiscal;

  final Map<String, Color> statusColors = {
    'Concluída': Colors.green, // Cor desejada para "Entregue"
  };

  HistoricoderemessasItemWidget(
      {Key? key, this.remessa, this.cieEscola, this.notaFiscal})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      // Use FutureBuilder para realizar os dois fetches
      future: Future.wait([
        ApiService().fetchEscolaByCieEscola(cieEscola!),
        ApiService().fetchAvaliacaoByNotaFiscal(notaFiscal!),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          final Escola escola = Escola.fromJson(snapshot.data![0]);
          final Avaliacao avaliacao = Avaliacao.fromJson(snapshot.data![1]);

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
                            "${remessa?.n_nota_fiscal}",
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
                    escola.nome,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 7.v),
                Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child: Text(
                    "Entregue: ${_formatDate(remessa?.data_estimada_fim)}",
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
                          color: statusColors[remessa?.status_entrega] ??
                              Colors.grey,
                          borderRadius: BorderRadius.circular(
                            7.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "${remessa?.status_entrega}",
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
                            "Nota: ${avaliacao.nota}",
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
      },
    );
  }

  String _formatDate(String? dateString) {
    if (dateString != null && dateString.isNotEmpty) {
      final DateTime dateTime =
          DateFormat('E, dd MMM yyyy HH:mm').parse(dateString);
      return DateFormat('dd/MM/yyyy - HH:mm').format(dateTime);
    }
    return 'Data não disponível';
  }
}

class Escola {
  final String nome;
  final String endereco;

  Escola({required this.nome, required this.endereco});

  factory Escola.fromJson(Map<String, dynamic> json) {
    return Escola(
      nome: json['nome'],
      endereco: json['endereco'],
    );
  }
}

class Avaliacao {
  final String nota;

  Avaliacao({required this.nota});

  factory Avaliacao.fromJson(Map<String, dynamic> json) {
    return Avaliacao(
      nota: json['avaliacao_entregador'],
    );
  }
}

class ApiService {
  Future<Map<String, dynamic>> fetchEscolaByCieEscola(String cieEscola) async {
    final response =
        await http.get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/escola/$cieEscola'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar dados da escola');
    }
  }

  Future<Map<String, dynamic>> fetchAvaliacaoByNotaFiscal(
      String notaFiscal) async {
    final response = await http
        .get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/avaliacao/$notaFiscal'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar dados da avaliação');
    }
  }
}
