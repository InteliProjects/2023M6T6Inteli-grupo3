import 'package:flutter/material.dart';
import 'package:luis_s_application/presentation/login_escola_screen/login_escola_screen.dart';
import 'package:luis_s_application/presentation/login_transportadora_screen/login_transportadora_screen.dart';
import 'package:luis_s_application/presentation/perfil_escola_screen/perfil_escola_screen.dart';
import 'package:luis_s_application/presentation/perfil_seduc_screen/perfil_seduc_screen.dart';
import 'package:luis_s_application/presentation/perfil_transportadora_screen/perfil_transportadora_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_a_caminho_seduc_screen/tela_de_rastreio_a_caminho_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_inicial_screen/tela_inicial_screen.dart';
import 'package:luis_s_application/presentation/login_fornecedor_screen/login_fornecedor_screen.dart';
import 'package:luis_s_application/presentation/login_seduc_screen/login_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_principal_entregador_page/tela_principal_entregador_page.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_screen/tela_principal_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_principal_escola_screen/tela_principal_escola_screen.dart';
import 'package:luis_s_application/presentation/entrega_em_andamento_entregador_screen/entrega_em_andamento_entregador_screen.dart';
import 'package:luis_s_application/presentation/criar_remessa_screen/criar_remessa_screen.dart';
import 'package:luis_s_application/presentation/user_type_selection_screen/user_type_selection_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_escola_screen/visualizar_remessa_escola_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_finalizada_escola_screen/visualizar_remessa_finalizada_escola_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_a_caminho_escola_screen/tela_de_rastreio_a_caminho_escola_screen.dart';
import 'package:luis_s_application/presentation/tirar_foto_entregador_screen/tirar_foto_entregador_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_screen/visualizar_remessa_screen.dart';
import 'package:luis_s_application/presentation/salvar_foto_entregador_screen/salvar_foto_entregador_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_pendendte_escola_screen/tela_de_rastreio_pendendte_escola_screen.dart';
import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_entregue_escola_screen/tela_de_rastreio_entregue_escola_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_screen/tela_de_rastreio_screen.dart';
import 'package:luis_s_application/presentation/historico_de_entrega_entregador_screen/historico_de_entrega_entregador_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_pendendte_seduc_screen/tela_de_rastreio_pendendte_seduc_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_entregue_seduc_screen/tela_de_rastreio_entregue_seduc_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_em_andamento_seduc_screen/visualizar_remessa_em_andamento_seduc_screen.dart';
import 'package:luis_s_application/presentation/avalia_o_escola_screen/avalia_o_escola_screen.dart';
import 'package:luis_s_application/presentation/historico_de_remessas_screen/historico_de_remessas_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_concluida_seduc_screen/visualizar_remessa_concluida_seduc_screen.dart';
import 'package:luis_s_application/presentation/historico_de_remessas_escola_screen/historico_de_remessas_escola_screen.dart';
import 'package:luis_s_application/presentation/tela_de_feedback_entregue_seduc_two_screen/tela_de_feedback_entregue_seduc_two_screen.dart';
import 'package:luis_s_application/presentation/tela_de_feedback_entregue_seduc_one_screen/tela_de_feedback_entregue_seduc_one_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_a_caminho_escola_one_screen/tela_de_rastreio_a_caminho_escola_one_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_pendendte_seduc_one_screen/tela_de_rastreio_pendendte_seduc_one_screen.dart';
import 'package:luis_s_application/presentation/tela_de_rastreio_entregue_seduc_one_screen/tela_de_rastreio_entregue_seduc_one_screen.dart';
import 'package:luis_s_application/presentation/transportadoras_screen/transportadoras_screen.dart';
import 'package:luis_s_application/presentation/tela_de_feedback_entregue_seduc_screen/tela_de_feedback_entregue_seduc_screen.dart';
import 'package:luis_s_application/presentation/cadastro_transportadoras_screen/cadastro_transportadoras_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_escola_one_screen/visualizar_remessa_escola_one_screen.dart';
import 'package:luis_s_application/presentation/perfil_fornecedor_screen/perfil_fornecedor_screen.dart';
import 'package:luis_s_application/presentation/visualizar_remessa_escola_two_screen/visualizar_remessa_escola_two_screen.dart';
import 'package:luis_s_application/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String telaInicialScreen = '/tela_inicial_screen';

  static const String userTypeSelectionScreen = '/user_type_selection_screen';

  static const String loginEscolaScreen = '/login_escola_screen';

  static const String loginFornecedorScreen = '/login_fornecedor_screen';

  static const String loginTransportadoraScreen =
      '/login_transportadora_screen';

  static const String loginSeducScreen = '/login_seduc_screen';

  static const String telaPrincipalFornecedortwoPage =
      '/tela_principal_fornecedortwo_page';

  static const String telaPrincipalEntregadorPage =
      '/tela_principal_entregador_page';

  static const String telaPrincipalSeducScreen = '/tela_principal_seduc_screen';

  static const String telaPrincipalEscolaScreen =
      '/tela_principal_escola_screen';

  static const String entregaEmAndamentoEntregadorScreen =
      '/entrega_em_andamento_entregador_screen';

  static const String criarRemessaScreen = '/criar_remessa_screen';

  static const String telaPrincipalSeducEscolasPage =
      '/tela_principal_seduc_escolas_page';

  static const String visualizarRemessaEscolaScreen =
      '/visualizar_remessa_escola_screen';

  static const String visualizarRemessaFinalizadaEscolaScreen =
      '/visualizar_remessa_finalizada_escola_screen';

  static const String criarRemessatwoScreen = '/criar_remessatwo_screen';

  static const String telaDeRastreioACaminhoEscolaScreen =
      '/tela_de_rastreio_a_caminho_escola_screen';

  static const String telaDeRastreioACaminhoSeducScreen =
      '/tela_de_rastreio_a_caminho_escola_screen';

  static const String tirarFotoEntregadorScreen =
      '/tirar_foto_entregador_screen';

  static const String telaPrincipalSeducEscolasDadosPage =
      '/tela_principal_seduc_escolas_dados_page';

  static const String telaPrincipalSeducEscolasDadosTabContainerScreen =
      '/tela_principal_seduc_escolas_dados_tab_container_screen';

  static const String visualizarRemessaScreen = '/visualizar_remessa_screen';

  static const String salvarFotoEntregadorScreen =
      '/salvar_foto_entregador_screen';

  static const String telaDeRastreioPendendteEscolaScreen =
      '/tela_de_rastreio_pendendte_escola_screen';

  static const String telaRemessasEmAndamentoSeducPage =
      '/tela_remessas_em_andamento_seduc_page';

  static const String telaRemessasEmAndamentoSeducTabContainerScreen =
      '/tela_remessas_em_andamento_seduc_tab_container_screen';

  static const String telaDeRastreioEntregueEscolaScreen =
      '/tela_de_rastreio_entregue_escola_screen';

  static const String telaDeRastreioScreen = '/tela_de_rastreio_screen';

  static const String historicoDeEntregaEntregadorScreen =
      '/historico_de_entrega_entregador_screen';

  static const String telaDeRastreioPendendteSeducScreen =
      '/tela_de_rastreio_pendendte_seduc_screen';

  static const String telaRemessasConcluidasSeducPage =
      '/tela_remessas_concluidas_seduc_page';

  static const String telaDeRastreioEntregueSeducScreen =
      '/tela_de_rastreio_entregue_seduc_screen';

  static const String visualizarRemessaEmAndamentoSeducScreen =
      '/visualizar_remessa_em_andamento_seduc_screen';

  static const String avaliaOEscolaScreen = '/avalia_o_escola_screen';

  static const String historicoDeRemessasScreen =
      '/historico_de_remessas_screen';

  static const String visualizarRemessaConcluidaSeducScreen =
      '/visualizar_remessa_concluida_seduc_screen';

  static const String historicoDeRemessasEscolaScreen =
      '/historico_de_remessas_escola_screen';

  static const String telaDeFeedbackEntregueSeducTwoScreen =
      '/tela_de_feedback_entregue_seduc_two_screen';

  static const String telaDeFeedbackEntregueSeducOneScreen =
      '/tela_de_feedback_entregue_seduc_one_screen';

  static const String telaDeRastreioACaminhoEscolaOneScreen =
      '/tela_de_rastreio_a_caminho_escola_one_screen';

  static const String telaDeRastreioPendendteSeducOneScreen =
      '/tela_de_rastreio_pendendte_seduc_one_screen';

  static const String telaDeRastreioEntregueSeducOneScreen =
      '/tela_de_rastreio_entregue_seduc_one_screen';

  static const String transportadorasScreen = '/transportadoras_screen';

  static const String telaDeFeedbackEntregueSeducScreen =
      '/tela_de_feedback_entregue_seduc_screen';

  static const String cadastroTransportadorasScreen =
      '/cadastro_transportadoras_screen';

  static const String visualizarRemessaEscolaOneScreen =
      '/visualizar_remessa_escola_one_screen';

  static const String perfilEscolaScreen = '/perfil_escola_screen';
  static const String perfilFornecedorScreen = '/perfil_fornecedor_screen';
  static const String perfilSeducScreen = '/perfil_seduc_screen';
  static const String perfiltransportadoraScreen = '/perfil_transportadora_screen';

  static const String visualizarRemessaEscolaTwoScreen =
      '/visualizar_remessa_escola_two_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    telaPrincipalEntregadorPage: (context) => TelaPrincipalEntregadorPage(),
    telaInicialScreen: (context) => TelaInicialScreen(),
    userTypeSelectionScreen: (context) => UserTypeSelectionScreen(),
    loginEscolaScreen: (context) => LoginEscolaScreen(),
    loginFornecedorScreen: (context) => LoginFornecedorScreen(),
    loginTransportadoraScreen: (context) => LoginTransportadoraScreen(),
    loginSeducScreen: (context) => LoginSeducScreen(),
    telaPrincipalSeducScreen: (context) => TelaPrincipalSeducScreen(),
    telaPrincipalEscolaScreen: (context) => TelaPrincipalEscolaScreen(),
    entregaEmAndamentoEntregadorScreen: (context) =>
        EntregaEmAndamentoEntregadorScreen(),
    criarRemessaScreen: (context) => CriarRemessaScreen(),
    visualizarRemessaEscolaScreen: (context) => VisualizarRemessaEscolaScreen(),
    visualizarRemessaFinalizadaEscolaScreen: (context) =>
        VisualizarRemessaFinalizadaEscolaScreen(),
    telaDeRastreioACaminhoEscolaScreen: (context) =>
        TelaDeRastreioACaminhoEscolaScreen(),
    tirarFotoEntregadorScreen: (context) => TirarFotoEntregadorScreen(),
    // telaPrincipalSeducEscolasDadosTabContainerScreen: (context) =>
    //     TelaPrincipalSeducEscolasDadosTabContainerScreen(),
    visualizarRemessaScreen: (context) => VisualizarRemessaScreen(),
    salvarFotoEntregadorScreen: (context) => SalvarFotoEntregadorScreen(),
    telaDeRastreioPendendteEscolaScreen: (context) =>
        TelaDeRastreioPendendteEscolaScreen(),
    telaRemessasEmAndamentoSeducTabContainerScreen: (context) =>
        TelaRemessasEmAndamentoSeducTabContainerScreen(),
    telaDeRastreioEntregueEscolaScreen: (context) =>
        TelaDeRastreioEntregueEscolaOneScreen(),
    telaDeRastreioScreen: (context) => TelaDeRastreioScreen(),

    historicoDeEntregaEntregadorScreen: (context) =>
        HistoricoDeEntregaEntregadorScreen(),
    telaDeRastreioPendendteSeducScreen: (context) =>
        TelaDeRastreioPendendteSeducScreen(),
    telaDeRastreioEntregueSeducScreen: (context) =>
        TelaDeRastreioEntregueSeducScreen(),
    visualizarRemessaEmAndamentoSeducScreen: (context) =>
        VisualizarRemessaEmAndamentoSeducScreen(),
    avaliaOEscolaScreen: (context) => AvaliaOEscolaScreen(),
    historicoDeRemessasScreen: (context) => HistoricoDeRemessasScreen(),
    visualizarRemessaConcluidaSeducScreen: (context) =>
        VisualizarRemessaConcluidaSeducScreen(),
    historicoDeRemessasEscolaScreen: (context) =>
        HistoricoDeRemessasEscolaScreen(),
    telaDeFeedbackEntregueSeducTwoScreen: (context) =>
        TelaDeFeedbackEntregueSeducTwoScreen(),
    telaDeFeedbackEntregueSeducOneScreen: (context) =>
        TelaDeFeedbackEntregueSeducOneScreen(),
    telaDeRastreioACaminhoEscolaOneScreen: (context) =>
        TelaDeRastreioACaminhoEscolaOneScreen(),
    telaDeRastreioACaminhoSeducScreen: (context) =>
        TelaDeRastreioACaminhoSeducOneScreen(),
    telaDeRastreioPendendteSeducOneScreen: (context) =>
        TelaDeRastreioPendendteSeducOneScreen(),
    telaDeRastreioEntregueSeducOneScreen: (context) =>
        TelaDeRastreioEntregueSeducOneScreen(),
    transportadorasScreen: (context) => TransportadorasScreen(),
    telaDeFeedbackEntregueSeducScreen: (context) =>
        TelaDeFeedbackEntregueSeducScreen(),
    cadastroTransportadorasScreen: (context) => CadastroTransportadorasScreen(),
    visualizarRemessaEscolaOneScreen: (context) =>
        VisualizarRemessaEscolaOneScreen(),
    perfilEscolaScreen: (context) => PerfilEscolaScreen(),
    perfilFornecedorScreen: (context) => PerfilFornecedorScreen(),
    perfilSeducScreen: (context) => PerfilSeducScreen(),
    perfiltransportadoraScreen: (context) => PerfilTransportadoraScreen(),
    visualizarRemessaEscolaTwoScreen: (context) =>
        VisualizarRemessaEscolaTwoScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };

  AppRoutes(entregaEmAndamentoEntregadorScreen);
}
