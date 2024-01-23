import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:luis_s_application/UserState.dart';
import 'package:luis_s_application/theme/theme_helper.dart';
import 'package:luis_s_application/routes/app_routes.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'luis_s_application',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.telaInicialScreen,
      routes: AppRoutes.routes,
    );
  }
}
