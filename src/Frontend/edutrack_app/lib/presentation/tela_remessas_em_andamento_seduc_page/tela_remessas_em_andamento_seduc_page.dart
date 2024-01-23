// import 'dart:ffi';
import 'package:luis_s_application/presentation/tela_de_rastreio_a_caminho_escola_one_screen/tela_de_rastreio_a_caminho_escola_one_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_a_caminho_seduc_screen/tela_de_rastreio_a_caminho_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_entregue_seduc_screen/tela_de_rastreio_entregue_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_pendendte_seduc_screen/tela_de_rastreio_pendendte_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_em_andamento_seduc_screen/visualizar_remessa_em_andamento_seduc_screen.dart';
import '../tela_remessas_em_andamento_seduc_page/widgets/telaremessasemandamentoseduc_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

class TelaRemessasEmAndamentoSeducPage extends StatefulWidget {
  final List<Remessa> remessas;
  final bool isLoading;

  const TelaRemessasEmAndamentoSeducPage({
    Key? key,
    required this.remessas,
    required this.isLoading,
  }) : super(key: key);

  @override
  TelaRemessasEmAndamentoSeducPageState createState() =>
      TelaRemessasEmAndamentoSeducPageState();
}

class TelaRemessasEmAndamentoSeducPageState
    extends State<TelaRemessasEmAndamentoSeducPage>
    with AutomaticKeepAliveClientMixin<TelaRemessasEmAndamentoSeducPage> {
  // bool isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    if (widget.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SafeArea(
          child: Scaffold(
              body: widget.remessas.length > 0
                  ? Container(
                      width: double.maxFinite,
                      decoration: AppDecoration.fillOnPrimary,
                      child: Column(children: [
                        SizedBox(height: 20.v),
                        _buildTelaremessasemandamentoSeduc(context)
                      ]))
                  : Container(
                      width: double.maxFinite,
                      decoration: AppDecoration.fillOnPrimary,
                      child: Column(
                        children: [
                          SizedBox(height: 20.v),
                          Expanded(
                              child: Text("Não existem remessas em andamento"))
                        ],
                      ))));
    }
  }

  /// Section Widget
  Widget _buildTelaremessasemandamentoSeduc(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.v);
                },
                itemCount: widget.remessas.length,
                itemBuilder: (context, index) {
                  return TelaremessasemandamentoseducItemWidget(
                      onTapComponent: () {
                        onTapComponent(context, widget.remessas[index]);
                      },
                      onTapRastrear: () { onTapRastrear(context, widget.remessas[index]);},
                      remessa: widget.remessas[index]);
                })));
  }

  /// Navigates to the visualizarRemessaEmAndamentoSeducScreen when the action is triggered.
  onTapComponent(BuildContext context, Remessa? remessa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            VisualizarRemessaEmAndamentoSeducScreen(remessa: remessa),
      ),
    );
  }

  onTapRastrear(BuildContext context, Remessa? remessa) {
    if (remessa?.status_entrega == "Entregue") {
      Navigator.pushNamed(
          context,
          AppRoutes.telaDeRastreioEntregueSeducScreen,
          arguments: {
            'n_nota_fiscal': remessa?.n_nota_fiscal,
            'data_criacao': remessa?.data_criacao,
            'data_inicio_entrega': remessa?.data_inicio_entrega,
            'data_entregue': remessa?.data_entregue,
          },
        );
    } else if (remessa?.status_entrega == "Em andamento") {
      Navigator.pushNamed(
          context,
          AppRoutes.telaDeRastreioACaminhoSeducScreen,
          arguments: {
            'n_nota_fiscal': remessa?.n_nota_fiscal,
            'data_criacao': remessa?.data_criacao,
            'data_inicio_entrega': remessa?.data_inicio_entrega,
            'data_entregue': remessa?.data_entregue,
          },
        );
    } else {
      Navigator.pushNamed(
          context,
          AppRoutes.telaDeRastreioPendendteSeducScreen,
          arguments: {
            'n_nota_fiscal': remessa?.n_nota_fiscal,
            'data_criacao': remessa?.data_criacao,
            'data_inicio_entrega': remessa?.data_inicio_entrega,
            'data_entregue': remessa?.data_entregue,
          },
        );
    }
  }
}

// class Remessa {
//   final String n_nota_fiscal;
//   final String cnpj_fornecedor;
//   final String cnpj_transportadora;
//   final String cie_escola;
//   final String? gpb_ger;
//   final String data_estimada_inicio;
//   final String data_estimada_fim;
//   String get data_estimada_fim_formatada => formatDate(data_estimada_fim.toString());
//   final String status_entrega;
//   final String email_usuario_transportadora;
//   final String email_usuario_escola;
//   final String data_entregue;
//   String get data_entregue_formatada => formatDate(data_entregue.toString());
//   final bool prova_entrega;
//   final String data_criacao;
//   String get data_criacao_formatada => formatDate(data_criacao.toString());
//   final String placa;
//   final int valor;

//   Remessa({
//     required this.n_nota_fiscal,
//     required this.cnpj_fornecedor,
//     required this.cnpj_transportadora,
//     required this.cie_escola,
//     required this.gpb_ger,
//     required this.data_estimada_inicio,
//     required this.data_estimada_fim,
//     required this.status_entrega,
//     required this.email_usuario_transportadora,
//     required this.email_usuario_escola,
//     required this.data_entregue,
//     required this.prova_entrega,
//     required this.data_criacao,
//     required this.placa,
//     required this.valor,
//   });

//   factory Remessa.fromJson(Map<String, dynamic> json) {
//     return Remessa(
//       n_nota_fiscal: json['n_nota_fiscal'] ?? 'covas',
//       cnpj_fornecedor: json['cnpj_fornecedor'],
//       cnpj_transportadora: json['cnpj_transportadora'],
//       cie_escola: json['cie_escola'],
//       gpb_ger: json['gpb_ger'],
//       data_estimada_inicio: json['data_estimada_inicio'],
//       data_estimada_fim: json['data_estimada_fim'],
//       status_entrega: json['status_entrega'] ?? 'covas',
//       email_usuario_transportadora: json['email_usuario_transportadora'],
//       email_usuario_escola: json['email_usuario_escola'],
//       data_entregue: json['data_entregue'].toString(),
//       prova_entrega: json['prova_entrega'] ?? 'covas',
//       data_criacao: json['data_criacao'],
//       placa: json['placa'] ?? 'covas',
//       valor: json['valor'],
//     );
//   }

//   static String formatDate(dateToFormat) {
//     if(dateToFormat != null) {
//       DateTime tempDate = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'")
//           .parse(dateToFormat, true)
//           .toLocal();
//       String formattedDate = DateFormat('dd/MM/yy').format(tempDate);
//       return formattedDate;
//     }
//     else {
//       return 'Sem data estimada';
//     }
//   }
// }

// class ApiService {
//   Future<List<Remessa>> fetchRemessas(cie_escola) async {
//     print("Entrou na req");
//     final response =
//         await http.get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entregas/status/${cie_escola}'));
//     print("passou da req");

//     if (response.statusCode == 200) {
//       print("response: ");
//       print(response);
//       List<dynamic> body = jsonDecode(response.body);
//       print("body: ");
//       print(body);
//       return body.map((item) => Remessa.fromJson(item)).toList();
//     } else {
//       throw Exception('Falha ao carregar dados');
//     }
//   }
// }

