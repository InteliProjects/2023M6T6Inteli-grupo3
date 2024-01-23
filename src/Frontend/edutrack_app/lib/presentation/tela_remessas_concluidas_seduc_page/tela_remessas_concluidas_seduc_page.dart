import 'package:luis_s_application/presentation/tela_de_feedback_entregue_seduc_screen/tela_de_feedback_entregue_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_dados_tab_container_screen/tela_principal_seduc_escolas_dados_tab_container_screen.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_page/tela_remessas_em_andamento_seduc_page.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_concluida_seduc_screen/visualizar_remessa_concluida_seduc_screen.dart';
import '../tela_remessas_concluidas_seduc_page/widgets/telaremessasconcluidasseduc_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaRemessasConcluidasSeducPage extends StatefulWidget {
  final List<Remessa> remessasConcluidas;
  const TelaRemessasConcluidasSeducPage(
      {Key? key, required this.remessasConcluidas})
      : super(key: key);

  @override
  TelaRemessasConcluidasSeducPageState createState() =>
      TelaRemessasConcluidasSeducPageState();
}

class TelaRemessasConcluidasSeducPageState
    extends State<TelaRemessasConcluidasSeducPage>
    with AutomaticKeepAliveClientMixin<TelaRemessasConcluidasSeducPage> {
  bool isLoading = true;
  List<Avaliacao> avaliacoes = [];
  List<double> avaliacoes_media = [];

  @override
  void initState() {
    super.initState();
    handle_fetch_avaliacoes();
  }

  bool get wantKeepAlive => true;

  handle_fetch_avaliacoes() async {
    await fetchAvaliacoes(widget.remessasConcluidas);
  }

  calcula_media(Avaliacao avaliacao) {
    double sum =
        avaliacao.atendimento + avaliacao.embalagem + avaliacao.materiais;
    double nota_media = sum / 3;
    return nota_media;
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: isLoading
                ? Center(child: CircularProgressIndicator())
                : Container(
                    width: double.maxFinite,
                    decoration: AppDecoration.fillOnPrimary,
                    child: Column(children: [
                      SizedBox(height: 20.v),
                      _buildTelaremessasconcluidasSeduc(context)
                    ]))));
  }

  /// Section Widget
  Widget _buildTelaremessasconcluidasSeduc(BuildContext context) {
    if (widget.remessasConcluidas.length > 0) {
      return Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 38.v);
                  },
                  itemCount: widget.remessasConcluidas.length,
                  itemBuilder: (context, index) {
                    return TelaremessasconcluidasseducItemWidget(
                        onTapVerFeedback: () {
                          onTapVerFeedback(context, avaliacoes[index]);
                        },
                        onTapComponent: () {
                          onTapComponent(context, widget.remessasConcluidas[index]);
                        },
                        remessa: widget.remessasConcluidas[index],
                        avaliacao: avaliacoes[index],
                        avaliacao_media: avaliacoes_media[index]);
                  })));
    } else {
      return Expanded(child: Text("Não existem remessas concluídas"));
    }
  }

  /// Navigates to the telaDeFeedbackEntregueSeducScreen when the action is triggered.
  
  onTapComponent(BuildContext context, Remessa? remessa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            VisualizarRemessaConcluidaSeducScreen(remessa: remessa),
      ),
    );
  }
  
  onTapVerFeedback(BuildContext context, Avaliacao avaliacao) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TelaDeFeedbackEntregueSeducScreen(avaliacao: avaliacao),
      ),
    );
  }

  Future<void> fetchAvaliacoes(List<Remessa> remessas) async {
    Iterable<Future<http.Response>> future_remessas =
        remessas.map((remessa) async {
      final response = await http.get(
        Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/avaliacao/${remessa.n_nota_fiscal}'),
      );
      setState(() {
        avaliacoes.add(Avaliacao.fromJson(jsonDecode(response.body)));
        avaliacoes_media
            .add(calcula_media(Avaliacao.fromJson(jsonDecode(response.body))));
      });

      return response;
    });

    await Future.wait(future_remessas);

    setState(() {
      isLoading = false;
    });
  }
}

class Avaliacao {
  final double embalagem;
  final double materiais;
  final double atendimento;
  final String feedback;

  Avaliacao({
    required this.embalagem,
    required this.materiais,
    required this.atendimento,
    required this.feedback,
  });

  factory Avaliacao.fromJson(Map<String, dynamic> json) {
    return Avaliacao(
      embalagem: double.parse(json['avaliacao_embalagem']),
      materiais: double.parse(json['avaliacao_materiais']),
      atendimento: double.parse(json['avaliacao_entregador']),
      feedback: json['feedback'],
    );
  }
}
