// Importa os pacotes necessários do Flutter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_escola.dart';
import 'package:luis_s_application/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class TelaDeRastreioPendendteSeducScreen extends StatelessWidget {
  // Construtor da classe
  TelaDeRastreioPendendteSeducScreen({
    Key? key,
  }) : super(key: key);

  // Chave global para o estado do navegador
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // Constrói a interface da tela
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String dataCriacao = args?['data_criacao'] ?? 'covas';
    String data_inicio_entrega = args?['data_inicio_entrega'] ?? 'covas';
    String? data_entregue = args?['data_entregue'] ?? 'covas';

    print(dataCriacao);
    print(data_inicio_entrega);
    print(data_entregue);

    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                children: [
                  _buildProfile(context),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.only(left: 41.h, right: 51.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgComponent98Gray500,
                          height: 153.v,
                          width: 15.h,
                          margin: EdgeInsets.only(bottom: 23.v),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pedido entregue a transportadora",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 2.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 1.h),
                                  child: Text(
                                    "${_formatDate(dataCriacao)}",
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ),
                                SizedBox(height: 30.v),
                                Text(
                                  "Pedido saiu para entrega",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 2.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 1.h),
                                  child: Text(
                                    "${_formatDate(data_inicio_entrega)}",
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ),
                                SizedBox(height: 30.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 1.h),
                                  child: Text(
                                    "Pedido entregue",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                Text(
                                  "${_formatDate(data_entregue)}",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Seção Widget para construir a barra de aplicativo personalizada
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
        margin: EdgeInsets.only(left: 39.h, top: 12.v, bottom: 10.v),
        onTap: () {
          onTapImage(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitle(text: "Status"),
      styleType: Style.bgFill,
    );
  }

  /// Seção Widget para construir o perfil na parte superior da tela
  Widget _buildProfile(BuildContext context) {
      final Map<String, dynamic>? args =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      final String nNotaFiscal = args?['n_nota_fiscal'] ?? '';

    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 32.h, bottom: 13.v, top: 13.v),
            child: CustomIconButton(
              height: 38.adaptSize,
              width: 38.adaptSize,
              padding: EdgeInsets.all(7.h),
              alignment: Alignment.bottomRight,
              child: CustomImageView(
                imagePath: ImageConstant.imgNavTransporte,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text("Status", style: theme.textTheme.titleLarge),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                "Pedido: " + nNotaFiscal,
                style: theme.textTheme.titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Seção Widget para construir a barra de navegação inferior
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarEscola(
      onChanged: (BottomBarEnum type) {},
    );
  }

  /// Navega para a tela anterior quando a ação é acionada.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
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
    return 'Aguardando ...';
  }
}
}
