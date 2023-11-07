import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prova_flutter/core/conts/conts.dart';
import 'package:prova_flutter/core/models/user_data.dart';

class LoginRepository {
  LoginRepository();

  Future<UserData?> logIn() async {
    var client = http.Client();
    UserData? userData;
    try {
      var response = await client.get(
        Uri.parse(baseUrl + user),
      );

      userData = UserData.fromJson((jsonDecode((response.body)) as List).first);
    } finally {
      client.close();
    }
    return userData;
  }
}
