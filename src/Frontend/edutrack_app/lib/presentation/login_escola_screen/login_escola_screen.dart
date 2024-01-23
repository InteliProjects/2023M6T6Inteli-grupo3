import 'package:flutter/material.dart';
import 'package:luis_s_application/UserState.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_principal_escola_screen/tela_principal_escola_screen.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LoginEscolaScreen extends StatelessWidget {
  LoginEscolaScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();
  TextEditingController seducController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          // Verifica se já existe um e-mail salvo no SharedPreferences
          future: checkSavedEmail(),
          builder: (context, snapshot) {
            return (snapshot.data == true)
                ? TelaPrincipalEscolaScreen() // Navegue para a tela principal se houver um e-mail salvo
                : buildLoginForm(
                    context); // Construa o formulário de login normalmente
          },
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 101.v),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 39.h,
                    right: 39.h,
                    bottom: 72.v,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 61.h),
                        child: Column(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgPinkModernBus59x59,
                              height: 59.adaptSize,
                              width: 59.adaptSize,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgPinkModernBus44x158,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 45.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "E-mail",
                          style: CustomTextStyles.bodyMediumGray50002,
                        ),
                      ),
                      SizedBox(height: 4.v),
                      _buildEmail(context),
                      SizedBox(height: 24.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Senha",
                          style: CustomTextStyles.bodyMediumGray50002,
                        ),
                      ),
                      SizedBox(height: 8.v),
                      _buildSeduc(context),
                      SizedBox(height: 38.v),
                      _buildAcessar(context),
                      SizedBox(height: 26.v),
                      Text(
                        "Continuar com",
                        style: CustomTextStyles.bodyMediumGray600,
                      ),
                      SizedBox(height: 9.v),
                      _buildEntrarComGOOGLE(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "escola@escola.com",
      autofocus: false,
      textInputType: TextInputType.emailAddress,
      textStyle: CustomTextStyles.bodyMediumPoppins,
      fillColor: Colors.white30,
    );
  }

  Widget _buildSeduc(BuildContext context) {
    return CustomTextFormField(
      controller: seducController,
      hintText: "Digite o CIE da escola",
      autofocus: false,
      textStyle: CustomTextStyles.bodyMediumPoppins,
      fillColor: Colors.white30,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildAcessar(BuildContext context) {
    return CustomElevatedButton(
      height: 27.v,
      width: 109.h,
      text: "Acessar".toUpperCase(),
      buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1,
      onPressed: () {
        onTapAcessar(context);
      },
    );
  }

  Widget _buildEntrarComGOOGLE(BuildContext context) {
    return CustomElevatedButton(
      height: 45.v,
      text: "Entrar com GOOGLE",
      margin: EdgeInsets.only(
        left: 36.h,
        right: 38.h,
      ),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 24.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgImage5,
          height: 21.adaptSize,
          width: 21.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineWhite,
      buttonTextStyle: CustomTextStyles.bodyMediumPoppins,
    );
  }

  // Verifica se já existe um e-mail salvo no SharedPreferences
  Future<bool> checkSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedCieEscola = prefs.getString('cieEscola');
    return savedEmail != null && savedCieEscola != null;
  }

  // Navega para a tela principal se as credenciais forem válidas
  onTapAcessar(BuildContext context) async {
    if (emailController.text.contains('@escola.com')) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', emailController.text);
      prefs.setString('cieEscola', seducController.text);
      final userState = Provider.of<UserState>(context, listen: false);
      String? savedCieEscola = prefs.getString('cieEscola');
      userState.setCieEscola(savedCieEscola.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TelaPrincipalEscolaScreen(),
        ),
      );
    } else {
      // Exibe uma mensagem de erro
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro no login'),
            content: Text('Email inválido.'),
            surfaceTintColor: Colors.white,
            icon: Icon(Icons.error),
            iconColor: Colors.red,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueAccent,
                  )),
            ],
          );
        },
      );
    }
  }
}
