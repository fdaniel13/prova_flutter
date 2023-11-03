import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';
import 'login_page.dart';
import 'login_repository.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.add((i) => LoginRepository());
    i.add((i) => LoginController());
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => const LoginPage(),
        transition: TransitionType.noTransition);
  }
}
