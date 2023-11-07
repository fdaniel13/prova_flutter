import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _sharedPreferences;

  Future<bool> saveList(
      {required String key, required List<String> value}) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences!.setStringList(key, value);
  }

  Future<List<String>> readList({required String key}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final list = _sharedPreferences!.getStringList(key);
    if (list == null || list.isEmpty) {
      return [];
    } else {
      return list;
    }
  }

  Future<bool> deleteList({required String key}) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences!.remove(key);
  }
}
