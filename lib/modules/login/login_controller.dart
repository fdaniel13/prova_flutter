import 'package:prova_flutter/core/functions/functions.dart';
import 'package:prova_flutter/core/models/user_data.dart';
import 'package:prova_flutter/modules/login/login_repository.dart';

class LoginController {
  LoginRepository _repository;
  LoginController(this._repository);

  Future<bool> canLogin(
      {required String username, required String pass}) async {
    bool canNavigate = false;
    UserData? user = await _repository.logIn();
    if (user != null) {
      canNavigate = username == user.name &&
          Functions().hashText(text: pass) == user.passHash;
    }
    return canNavigate;
  }

  bool validateUser({required String? username}) {
    bool isValid = username == null || username.isEmpty
        ? false
        : username.length <= 20 && (username[username.length - 1] != " ");

    return isValid;
  }

  bool validatePass({required String? pass}) {
    final exp = RegExp(r"([A-z0-9])");
    final exp2 = RegExp(r"(\W)");
    final exp3 = RegExp(r"([_])");
    bool isValid = pass == null || pass.isEmpty
        ? false
        : pass.length >= 2 &&
            pass.length <= 20 &&
            (pass[pass.length - 1] != " ") &&
            exp.hasMatch(pass) &&
            !exp2.hasMatch(pass) &&
            !exp3.hasMatch(pass);

    return isValid;
  }
}
