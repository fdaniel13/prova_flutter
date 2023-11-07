import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';
import 'login_page.dart';
import 'login_repository.dart';
import 'pages/web_view_page.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.add(LoginRepository.new);
    i.add(LoginController.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => const LoginPage(),
        transition: TransitionType.noTransition);
    r.child('/webPage',
        child: (context) => const WebViewPage(),
        transition: TransitionType.noTransition);
  }
}
