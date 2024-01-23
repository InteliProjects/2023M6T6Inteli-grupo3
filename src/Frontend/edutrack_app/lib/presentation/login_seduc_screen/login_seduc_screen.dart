import 'package:flutter/material.dart';
import 'package:luis_s_application/UserState.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/tela_principal_seduc_screen/tela_principal_seduc_screen.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:luis_s_application/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class LoginSeducScreen extends StatelessWidget {
  LoginSeducScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController seducController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: FutureBuilder(
                // Verifica se já existe um e-mail salvo no SharedPreferences
                future: checkSavedEmail(),
                builder: (context, snapshot) {
                  return (snapshot.data == true)
                      ? TelaPrincipalSeducScreen() // Navegue para a tela principal se houver um e-mail salvo
                      : Form(
                          key: _formKey,
                          child: SizedBox(
                              width: double.maxFinite,
                              child: Column(children: [
                                SizedBox(height: 101.v),
                                Expanded(
                                    child: SingleChildScrollView(
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 39.h,
                                                right: 39.h,
                                                bottom: 181.v),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Column(children: [
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgPinkModernBus59x59,
                                                            height:
                                                                59.adaptSize,
                                                            width:
                                                                59.adaptSize),
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgPinkModernBus44x158)
                                                      ])),
                                                  SizedBox(height: 45.v),
                                                  Text("E-mail",
                                                      style: CustomTextStyles
                                                          .bodyMediumGray50002),
                                                  SizedBox(height: 4.v),
                                                  CustomTextFormField(
                                                      controller:
                                                          emailController,
                                                      hintText:
                                                          "usuario1@seduc.com",
                                                      textInputType:
                                                          TextInputType
                                                              .emailAddress),
                                                  SizedBox(height: 24.v),
                                                  Text("Senha",
                                                      style: CustomTextStyles
                                                          .bodyMediumGray50002),
                                                  SizedBox(height: 8.v),
                                                  CustomTextFormField(
                                                      controller:
                                                          seducController,
                                                      hintText: "Digite sua senha",
                                                      textInputAction:
                                                          TextInputAction.done),
                                                  SizedBox(height: 43.v),
                                                  CustomElevatedButton(
                                                      width: 109.h,
                                                      text: "Acessar"
                                                          .toUpperCase(),
                                                      buttonStyle:
                                                          CustomButtonStyles
                                                              .fillSecondaryContainerTL18,
                                                      buttonTextStyle:
                                                          CustomTextStyles
                                                              .titleSmallOnPrimary_1,
                                                      onPressed: () {
                                                        onTapAcessar(context);
                                                      },
                                                      alignment:
                                                          Alignment.center),
                                                  SizedBox(height: 47.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 83.h),
                                                      child: Text(
                                                          "Continuar com",
                                                          style: CustomTextStyles
                                                              .bodyMediumGray600)),
                                                  SizedBox(height: 9.v),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgImage8,
                                                      height: 31.v,
                                                      alignment:
                                                          Alignment.center,
                                                      onTap: () {
                                                        onTapImgImageEight(
                                                            context);
                                                      })
                                                ]))))
                              ])));
                })));
  }

  Future<bool> checkSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('emailSeduc');
    String? savedSenha = prefs.getString('senhaSeduc');
    return savedEmail != null && savedSenha != null;
  }

  onTapAcessar(BuildContext context) async {
    if (emailController.text.contains('@seduc.com')) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('emailSeduc', emailController.text);
      prefs.setString('senhaSeduc', seducController.text);
      final userState = Provider.of<UserState>(context, listen: false);
      String? savedSenha = prefs.getString('senhaSeduc');
      userState.setSenhaSeduc(savedSenha.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TelaPrincipalSeducScreen(),
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

  /// Navigates to the telaPrincipalSeducScreen when the action is triggered.
  onTapImgImageEight(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.telaPrincipalSeducScreen);
  }
}
