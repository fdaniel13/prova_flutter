import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/core/theme/app_theme.dart';

import 'modules/app_module.dart';
import 'modules/app_page.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

Future<void> main() async {
  var bytes = utf8.encode("senha"); // data being hashed

  var digest = sha1.convert(bytes);

  print("Digest as bytes: ${digest.bytes}");
  print("Digest as hex string: $digest");
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
