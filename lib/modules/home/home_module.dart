import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/core/services/local_data/shared_preferences.dart';
import 'package:prova_flutter/modules/home/store/crud.dart';

import '../../core/pages/web_view_page.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'home_repository.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add(HomeRepository.new);
    i.add(SharedPreferencesService.new);
    i.add(Crud.new);
    i.add(HomeController.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => const HomePage(),
        transition: TransitionType.noTransition);
    r.child('/webPage',
        child: (context) => const WebViewPage(),
        transition: TransitionType.noTransition);
  }
}
