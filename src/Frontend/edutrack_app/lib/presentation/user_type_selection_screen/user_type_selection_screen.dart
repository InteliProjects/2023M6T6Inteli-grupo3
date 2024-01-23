import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.secondaryContainer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              text: 'Logar como Escola',
              width: 200.h,
              buttonStyle: CustomButtonStyles.outlineWhite,
              buttonTextStyle: TextStyle(color: Colors.blue),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginEscolaScreen);
              },
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              text: 'Logar como Seduc',
              width: 200.h,
              buttonStyle: CustomButtonStyles.outlineWhite,
              buttonTextStyle: TextStyle(color: Colors.blue),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginSeducScreen);
              },
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              text: 'Logar como fornecedor',
              width: 200.h,
              buttonStyle: CustomButtonStyles.outlineWhite,
              buttonTextStyle: TextStyle(color: Colors.blue),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginFornecedorScreen);
              },
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              text: 'Logar como transportadora',
              width: 200.h,
              buttonStyle: CustomButtonStyles.outlineWhite,
              buttonTextStyle: TextStyle(color: Colors.blue),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginTransportadoraScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
