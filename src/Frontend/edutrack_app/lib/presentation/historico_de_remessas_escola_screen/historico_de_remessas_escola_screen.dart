// Importa os pacotes necessários do Flutter
import '../historico_de_remessas_escola_screen/widgets/historicoderemessasescola_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';

// Tela para exibir o histórico de remessas da escola
class HistoricoDeRemessasEscolaScreen extends StatelessWidget {
  HistoricoDeRemessasEscolaScreen({Key? key}) : super(key: key);

  // Chave global para o estado do navegador
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // Constrói a interface da tela
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              // Constrói o componente da seção 52
              _buildComponentFiftyTwo(context),
              SizedBox(height: 24.v),
              // Constrói a seção do histórico de remessas da escola
              _buildHistoricoderemessasEscola(context),
            ],
          ),
        ),
        // Adiciona a barra de navegação inferior personalizada
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Seção do Widget para construir o componente FiftyTwo
  Widget _buildComponentFiftyTwo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.v),
      decoration: AppDecoration.fillSecondaryContainer,
      child: Column(
        children: [
          SizedBox(height: 6.v),
          // Barra de aplicativo personalizada
          CustomAppBar(
            height: 32.v,
            centerTitle: true,
            title: AppbarSubtitle(
              text: "Histórico",
            ),
            actions: [
              // Ícone de notificação na barra de aplicativo
              AppbarTrailingImage(
                imagePath: ImageConstant.imgNotification,
                margin: EdgeInsets.only(
                  left: 40.h,
                  top: 8.v,
                  right: 40.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Seção do Widget para construir o histórico de remessas da escola
  Widget _buildHistoricoderemessasEscola(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 20.v,
            );
          },
          itemCount: 3, // Número fictício de itens no histórico
          itemBuilder: (context, index) {
            // Item do histórico de remessas da escola
            return HistoricoderemessasescolaItemWidget();
          },
        ),
      ),
    );
  }

  /// Seção do Widget para construir a barra de navegação inferior
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}
