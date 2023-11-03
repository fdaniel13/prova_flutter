import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_module.dart';
import 'login/login_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/auth',
        module: LoginModule(), transition: TransitionType.noTransition);
    r.module('/home',
        module: HomeModule(), transition: TransitionType.noTransition);
  }
}
