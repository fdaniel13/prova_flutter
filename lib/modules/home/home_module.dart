import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'home_repository.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add((i) => HomeRepository());
    i.add((i) => HomeController());
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => const HomePage(),
        transition: TransitionType.noTransition);
  }
}
