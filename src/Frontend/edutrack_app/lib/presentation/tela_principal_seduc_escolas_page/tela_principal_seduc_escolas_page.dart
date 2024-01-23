import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_tab_container_screen/tela_remessas_em_andamento_seduc_tab_container_screen.dart';
import '../tela_principal_seduc_escolas_page/widgets/telaprincipalseducescolas_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_dados_tab_container_screen/tela_principal_seduc_escolas_dados_tab_container_screen.dart';
// import 'package:luis_s_application/presentation/tela_remessas_em_andamento_seduc_page/tela_remessas_em_andamento_seduc_page.dart';
// import TelaRemessasEmAndamentoSeducTabContainerScreen

class TelaPrincipalSeducEscolasPage extends StatefulWidget {
  final List<Escola> escolas;

  const TelaPrincipalSeducEscolasPage({Key? key, required this.escolas}) : super(key: key);

  @override
  TelaPrincipalSeducEscolasPageState createState() =>
      TelaPrincipalSeducEscolasPageState();
}

class TelaPrincipalSeducEscolasPageState
    extends State<TelaPrincipalSeducEscolasPage>
    with AutomaticKeepAliveClientMixin<TelaPrincipalSeducEscolasPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillOnPrimary,
                child: Column(children: [
                  SizedBox(height: 20.v),
                  _buildTelaprincipalSeducescolas(context)
                ]))));
  }

  /// Section Widget
  Widget _buildTelaprincipalSeducescolas(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 120.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.h),
                physics: BouncingScrollPhysics(),
                itemCount: widget.escolas.length,
                        itemBuilder: (context, index) {
                          Escola escola = widget.escolas[index];
                          return TelaprincipalseducescolasItemWidget(
                            escola: escola,
                            onTapComponentVariant: () {
                              onTapComponentVariant(context, escola);
                  });
                })));
  }

  /// Navigates to the telaRemessasEmAndamentoSeducTabContainerScreen when the action is triggered.
  onTapComponentVariant(BuildContext context, Escola escola) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaRemessasEmAndamentoSeducTabContainerScreen(escola: escola),
      ),
    );
  }
}
