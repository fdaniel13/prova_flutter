import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _sharedPreferences;

  Future<bool> saveObject({required String key, required dynamic value}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (value is String) {
      return _sharedPreferences!.setString(key, value);
    } else {
      return _sharedPreferences!
          .setString(key, value == null ? '' : jsonEncode(value));
    }
  }

  Future<String> readStringData(String acessKey) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences!.getString(acessKey).toString();
  }

  Future<Map<String, dynamic>> readObject({required String key}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final map = _sharedPreferences!.getString(key);
    if (map == null || map.isEmpty) {
      return {};
    } else {
      return jsonDecode(map);
    }
  }

  Future<void> deleteAccessData(String acessKey) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setString(acessKey, "");
  }
}
