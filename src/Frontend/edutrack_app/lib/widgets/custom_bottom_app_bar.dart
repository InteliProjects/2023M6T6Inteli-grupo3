// Importa os pacotes necessários do Flutter
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

// Widget personalizado para a barra de navegação inferior
class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int selectedIndex = 0; // Índice do item selecionado na barra de navegação

  // Lista de modelos para os itens da barra de navegação inferior
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavInCioOnprimary,
      activeIcon: ImageConstant.imgNavInCioOnprimary,
      title: "Início",
      type: BottomBarEnum.Incio,
      route: AppRoutes.appNavigationScreen,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavHistRico,
      activeIcon: ImageConstant.imgNavHistRico,
      title: "Histórico",
      type: BottomBarEnum.Histrico,
      route: AppRoutes.historicoDeRemessasScreen,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFloatingIcon,
      activeIcon: ImageConstant.imgFloatingIcon,
      title: "Criar",
      type: BottomBarEnum.Histrico,
      route: AppRoutes.criarRemessaScreen,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavTransporte,
      activeIcon: ImageConstant.imgNavTransporte,
      title: "Transporte",
      type: BottomBarEnum.Transporte,
      route: AppRoutes.transportadorasScreen,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavPerfilOnprimary,
      activeIcon: ImageConstant.imgNavPerfilOnprimary,
      title: "Perfil",
      type: BottomBarEnum.Perfil,
      route: AppRoutes.perfilFornecedorScreen,
    ),
  ];

  // Constrói a interface da barra de navegação inferior
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: theme.colorScheme.secondaryContainer,
      child: SizedBox(
        height: 20.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomMenuList.length,
            (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // Atualiza o índice do item selecionado
                  });
                  bottomMenuList[index].onTap?.call();
                  widget.onChanged?.call(bottomMenuList[index].type);
                  Navigator.of(context).pushNamed(bottomMenuList[index].route);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: index == selectedIndex
                          ? bottomMenuList[index].activeIcon
                          : bottomMenuList[index].icon,
                      height: 20.v,
                      width: 23.h,
                      color: theme.colorScheme.onPrimary.withOpacity(1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: CustomTextStyles.labelMediumOnPrimary_1.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Enumeração para representar os diferentes itens da barra de navegação inferior
enum BottomBarEnum {
  Incio,
  Histrico,
  Transporte,
  Perfil,
}

// Modelo para um item de menu na barra de navegação inferior
class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isSelected = false,
    this.onTap,
    required this.route,
  });

  String icon;
  String activeIcon;
  String? title;
  BottomBarEnum type;
  bool isSelected;
  VoidCallback? onTap; // Função de retorno a ser executada ao tocar no item
  String route; // Rota associada ao item do menu
}

// Widget padrão que exibe um texto de substituição
class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Por favor, substitua o Widget respectivo aqui',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
