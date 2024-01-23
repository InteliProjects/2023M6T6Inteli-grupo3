import 'package:luis_s_application/presentation/login_seduc_screen/login_seduc_screen.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_seduc.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_screen/widgets/telaprincipalseduc_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
// import 'package:luis_s_application/widgets/custom_bottom_app_bar.dart';
// import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:luis_s_application/presentation/tela_principal_seduc_escolas_dados_tab_container_screen/tela_principal_seduc_escolas_dados_tab_container_screen.dart';
// import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_title.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TelaPrincipalSeducScreen extends StatefulWidget {
  @override
  _TelaPrincipalSeducScreenState createState() => _TelaPrincipalSeducScreenState();
}

class _TelaPrincipalSeducScreenState extends State<TelaPrincipalSeducScreen> {
  late List<Diretoria> diretorias = [];
  late List<Diretoria> diretorias_filtradas =[];
  bool isLoading = true;
  TextEditingController pesquisa = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    try {
      diretorias = await ApiService().fetchDiretorias();
      setState(() {
        isLoading = false;
        diretorias_filtradas = diretorias;
      });
    } catch (e) {
      // Tratar exceção ou erro de carregamento
      print(e); // Por exemplo
    }
  }

  void filtragemPorPesquisa(String query){
    if (query.isEmpty){
      setState(() {
        diretorias_filtradas = diretorias;
      });
      return;
    }
    List<Diretoria> lista_temporaria = [];
    for (Diretoria diretoria in diretorias){
      if (diretoria.nome.toLowerCase().contains(query.toLowerCase())){
        lista_temporaria.add(diretoria);
      }
    }
    setState(() {
      diretorias_filtradas = lista_temporaria;
    });

  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildComponentVariantSix(context),
              SizedBox(height: 20.v),
              _buildTelaprincipalSeduc(context),
              SizedBox(height: 5.v), 
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

    /// Section Widget
  Widget _buildComponentVariantSix(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 6.v),
    decoration: AppDecoration.fillSecondaryContainer,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 4.v),
        CustomAppBar(
          height: 32.v,
          leadingWidth: 68.h,
          centerTitle: true,
          title: AppbarTitle(text: "Diretorias"),
          actions: [
              Row(
                children: [
                  SizedBox(width: 8.h), // Adicione um espaçamento entre os ícones
                  IconButton(
                    icon: Tooltip(
                      message: 'Sair',
                      child: Icon(Icons.logout_rounded),
                    ),
                    color: Colors.white70,
                    onPressed: () {
                      _showLogoutConfirmationDialog(context);
                    },
                  ),
                ],
              ),
            ],
            ),
        SizedBox(height: 10),
        _buildBarraDePesquisa(context), 
        SizedBox(height: 5.v),
      ],
    ),
  );
}

Widget _buildBarraDePesquisa(BuildContext context) {
  return Container(
    height: 35,
    width: 350,
    child: TextField(
      onChanged: (query) {
        filtragemPorPesquisa(query);
      },
      controller: pesquisa,
      decoration: InputDecoration(
        labelText: "Buscar Diretoria",
        prefixIcon: Icon(Icons.search, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white), // Estilo para o texto do label (quando não está focado)
        floatingLabelStyle: TextStyle(color: Colors.white), // Estilo para o texto do label (quando está focado)
        contentPadding: EdgeInsets.symmetric(vertical: 2),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        enabledBorder: OutlineInputBorder( // Estilo da borda quando o TextField não está focado
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        focusedBorder: OutlineInputBorder( // Estilo da borda quando o TextField está focado
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0))
        ),
      ),
      style: TextStyle(color: Colors.white), // Estilo para o texto digitado pelo usuário
      cursorColor: Colors.white, // Cor do cursor
    ),
  );
}
  
  Widget _buildTelaprincipalSeduc(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 10),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 100.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 20.h,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: diretorias_filtradas.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaPrincipalSeducEscolasDadosTabContainerScreen(diretoria: diretorias_filtradas[index]),
                        ),
                      );
                    },
                    child: TelaprincipalseducItemWidget(diretoria: diretorias_filtradas[index]),
                  );
                },
              ),
      ),
    );
  }
  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarSeduc(
      onChanged: (BottomBarEnum type) {
        if (type == BottomBarEnum.Perfil) {
          Navigator.of(context).pushNamed(AppRoutes.perfilSeducScreen);
        }
      },
    );
  }

    onTapImage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.telaPrincipalSeducScreen);
  }

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmação de Logout'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        content: Text('Tem certeza de que deseja fazer logout?'),
        contentTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w100,
          color: Colors.black,
        ),
        surfaceTintColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Cancelar'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
            )
          ),
          TextButton(
            onPressed: () {
              logout(context);
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Confirmar'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blueAccent,
            )
          ),
        ],
      );
    },
  );
}

  static void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('emailSeduc');
    prefs.remove('senhaSeduc');

    // Navegar de volta para a tela de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginSeducScreen(),
      ),
    );
  }
}


// Modelo de dados para Diretoria
class Diretoria {
  final String nome;
  final String regiao;

  Diretoria({required this.nome, required this.regiao});

  factory Diretoria.fromJson(Map<String, dynamic> json) {
    return Diretoria(
      nome: json['nome'],
      regiao: json['regiao'],
    );
  }
}

// Serviço de API
class ApiService {
  Future<List<Diretoria>> fetchDiretorias() async {
    final response = await http.get(Uri.parse('http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/diretorias'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Diretoria.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }

}
