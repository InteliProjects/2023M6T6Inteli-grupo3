import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

class CustomBottomAppBarEscola extends StatefulWidget {
  CustomBottomAppBarEscola({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarEscolaState createState() => CustomBottomAppBarEscolaState();
}

class CustomBottomAppBarEscolaState extends State<CustomBottomAppBarEscola> {
  int selectedIndex = 0;

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
      icon: ImageConstant.imgNavPerfilOnprimary,
      activeIcon: ImageConstant.imgNavPerfilOnprimary,
      title: "Perfil",
      type: BottomBarEnum.Perfil,
      route: AppRoutes.perfilEscolaScreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: theme.colorScheme.secondaryContainer,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomMenuList.length,
            (index) {
              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
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
                        height: 17.v,
                        width: 17.h,
                        color: theme.colorScheme.onPrimary.withOpacity(1),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.v),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: CustomTextStyles.labelMediumOnPrimary_1.copyWith(
                            fontSize: 9.v,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
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
