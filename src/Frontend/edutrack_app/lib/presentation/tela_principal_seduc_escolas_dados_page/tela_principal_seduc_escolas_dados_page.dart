import 'package:luis_s_application/presentation/tela_principal_seduc_screen/tela_principal_seduc_screen.dart';
import '../tela_principal_seduc_escolas_dados_page/widgets/telaprincipalseducescolasdados_item_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import Diretoria;

// ignore_for_file: must_be_immutable
class TelaPrincipalSeducEscolasDadosPage extends StatefulWidget {
  final Diretoria diretoria;

  const TelaPrincipalSeducEscolasDadosPage({Key? key, required this.diretoria}) : super(key: key);

  @override
  TelaPrincipalSeducEscolasDadosPageState createState() => TelaPrincipalSeducEscolasDadosPageState();
}

class TelaPrincipalSeducEscolasDadosPageState extends State<TelaPrincipalSeducEscolasDadosPage> {
  List<String> titulos = ["Pendente", "Em andamento", "Entregue", "Concluídas"];
  List<int> quantidades = [];
  List<Remessa> remessas = [];
  List<MapEntry<String, int>> escolasComMaisPendentes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entregas/${widget.diretoria.nome}'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        remessas = jsonList.map((json) => Remessa.fromJson(json)).toList();

        // Contagem de remessas por status
        int pendentes = 0;
        int emAndamento = 0;
        int concluidas = 0;
        int entregues = 0;
        Map<String, int> contagemEscolas = {};

        for (var remessa in remessas) {
          switch (remessa.statusEntrega) {
            case 'Pendente':
              pendentes++;
              if (contagemEscolas.containsKey(remessa.cieEscola)) {
                contagemEscolas[remessa.cieEscola] = contagemEscolas[remessa.cieEscola]! + 1;
              } else {
                contagemEscolas[remessa.cieEscola] = 1;
              }
              break;
            case 'Em andamento':
              emAndamento++;
              break;
            case 'Entregue':
              entregues++;
              break;
            case 'Concluída':
              concluidas++;
              break;
          }
        }

        quantidades = [pendentes, emAndamento, entregues, concluidas];

        List<MapEntry<String, int>> escolasOrdenadas = contagemEscolas.entries.toList();
        escolasOrdenadas.sort((a, b) => b.value.compareTo(a.value));
        escolasComMaisPendentes = escolasOrdenadas.take(3).toList();

        for (int i = 0; i < escolasComMaisPendentes.length; i++) {
          try {
            EscolaInfo info = await fetchEscolaInfo(escolasComMaisPendentes[i].key);
            escolasComMaisPendentes[i] = MapEntry(info.nome, escolasComMaisPendentes[i].value);
          } catch (e) {
            print('Erro ao buscar informações da escola: $e');
          }
        }

        setState(() {
          isLoading = false;
        });
      } else {
        throw Exception('Falha ao carregar dados');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10.v),
                      Text(
                        "KPI's",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // Adicione outros estilos como tamanho da fonte, cor, etc.
                          fontSize: 16.0, // Exemplo de tamanho de fonte
                          color: Colors.black, // Exemplo de cor
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Column(
                          children: [
                            _buildTelaprincipalSeducescolasdados(context),
                            SizedBox(height: 42.v),
                            Text(
                              "Piores escolas:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // Adicione outros estilos como tamanho da fonte, cor, etc.
                                fontSize: 16.0, // Exemplo de tamanho de fonte
                                color: Colors.black, // Exemplo de cor
                              ),
                            ),
                            _buildListaEscolasComMaisPendentes(),
                            // Adicione mais widgets conforme necessário
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildTelaprincipalSeducescolasdados(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(height: 22.v),
      itemCount: 4,
      itemBuilder: (context, index) {
        return TelaprincipalseducescolasdadosItemWidget(titulo: titulos[index], quantidade: quantidades[index], total: remessas.length);
      },
    );
  }

  Widget _buildListaEscolasComMaisPendentes() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: escolasComMaisPendentes.length,
      itemBuilder: (context, index) {
        var escola = escolasComMaisPendentes[index];
        return ListTile(
          title: Text('Escola: ${escola.key}'),
          subtitle: Text('Entregas Pendentes: ${escola.value}'),
        );
      },
    );
  }
}

  

  /// Section Widget
  Widget _buildComponent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: DottedBorder(
        color: appTheme.black900,
        padding: EdgeInsets.only(
          left: 1.h,
          top: 1.v,
          right: 1.h,
          bottom: 1.v,
        ),
        strokeWidth: 1.h,
        radius: Radius.circular(5),
        borderType: BorderType.RRect,
        dashPattern: [
          5,
          5,
        ],
        child: Container(
          width: 314.h,
          padding: EdgeInsets.symmetric(
            horizontal: 103.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.outlineBlack900.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 7.v),
              CustomImageView(
                imagePath: ImageConstant.imgUpload,
                height: 22.v,
                width: 37.h,
                margin: EdgeInsets.only(left: 28.h),
              ),
              SizedBox(height: 6.v),
              Text(
                "Arquivo CSV até  10MB",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }


class Remessa {
  String cieEscola;
  String cnpjFornecedor;
  String cnpjTransportadora;
  DateTime dataCriacao;
  DateTime? dataEntregue;
  DateTime dataEstimadaInicio;
  DateTime dataEstimadaFim;
  String emailUsuarioEscola;
  String emailUsuarioTransportadora;
  String gpbGer;
  String nNotaFiscal;
  String placa;
  bool provaEntrega;
  String statusEntrega;
  int valor;
  DateTime? dataInicioEntrega;

  Remessa({
    required this.cieEscola,
    required this.cnpjFornecedor,
    required this.cnpjTransportadora,
    required this.dataCriacao,
    this.dataEntregue,
    required this.dataEstimadaInicio,
    required this.dataEstimadaFim,
    required this.emailUsuarioEscola,
    required this.emailUsuarioTransportadora,
    required this.gpbGer,
    required this.nNotaFiscal,
    required this.placa,
    required this.provaEntrega,
    required this.statusEntrega,
    required this.valor,
    this.dataInicioEntrega,
  });

factory Remessa.fromJson(Map<String, dynamic> json) {
  return Remessa(
    cieEscola: json['cie_escola'],
    cnpjFornecedor: json['cnpj_fornecedor'],
    cnpjTransportadora: json['cnpj_transportadora'],
    dataCriacao: DateTime.parse(json['data_criacao']),
    dataEntregue: json['data_entregue'] != null ? DateTime.parse(json['data_entregue']) : null,
    dataEstimadaInicio: DateTime.parse(json['data_estimada_inicio']),
    dataEstimadaFim: DateTime.parse(json['data_estimada_fim']),
    emailUsuarioEscola: json['email_usuario_escola'],
    emailUsuarioTransportadora: json['email_usuario_transportadora'],
    gpbGer: json['gpb_ger'],
    nNotaFiscal: json['n_nota_fiscal'],
    placa: json['placa'],
    provaEntrega: json['prova_entrega'],
    statusEntrega: json['status_entrega'],
    valor: json['valor'],
    dataInicioEntrega: json['data_inicio_entrega'] != null ? DateTime.parse(json['data_inicio_entrega']) : null,
  );
}
}

Future<List<Remessa>> fetchEntregasPorDiretoria(String diretoria) async {
  final remessas = await http.get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/entregas/$diretoria'));

  if (remessas.statusCode == 200) {
    List<dynamic> jsonList = json.decode(remessas.body);
    return jsonList.map((json) => Remessa.fromJson(json)).toList();
  } else {
    throw Exception('Falha ao carregar dados');
  }
}

class EscolaInfo {
  final String nome;
  final String cie;

  EscolaInfo({
    required this.nome,
    required this.cie,
    // Inicialize outros campos conforme necessário
  });

  factory EscolaInfo.fromJson(Map<String, dynamic> json) {
    return EscolaInfo(
      nome: json['nome'],
      cie: json['cie'],
      // Inicialize outros campos conforme necessário
    );
  }
}

Future<EscolaInfo> fetchEscolaInfo(String cieEscola) async {
  final resposta = await http.get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/escola/$cieEscola'));

  if (resposta.statusCode == 200) {
    return EscolaInfo.fromJson(json.decode(resposta.body));
  } else {
    throw Exception('Falha ao carregar informações da escola');
  }
}