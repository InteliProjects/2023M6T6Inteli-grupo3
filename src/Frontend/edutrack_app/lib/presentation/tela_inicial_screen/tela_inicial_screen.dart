import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

class TelaInicialScreen extends StatefulWidget {
  const TelaInicialScreen({Key? key}) : super(key: key);

  @override
  _TelaInicialScreenState createState() => _TelaInicialScreenState();
}

class _TelaInicialScreenState extends State<TelaInicialScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {

      setState(() {
        isLoading = false;
      });

      if (!isLoading) {
        Navigator.pushReplacementNamed(context, AppRoutes.userTypeSelectionScreen);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.secondaryContainer,
        body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgPinkModernBus,
                          height: 295.v,
                          width: 266.h,
                          alignment: Alignment.center,
                          ),
                        CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
              ]
          )
      ),
    );
  }
}
