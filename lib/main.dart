import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/core/theme/app_theme.dart';

import 'modules/app_module.dart';
import 'modules/app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    home: ModularApp(
      module: AppModule(),
      child: const AppPage(),
    ),
  ));
}
