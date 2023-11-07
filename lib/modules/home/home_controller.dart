import 'package:prova_flutter/core/services/local_data/shared_preferences.dart';
import 'package:prova_flutter/modules/home/store/crud.dart';

import '../../core/conts/conts.dart';

class HomeController {
  Crud crud;
  SharedPreferencesService _sharedPreferencesService;
  HomeController(this.crud, this._sharedPreferencesService);

  Future saveText({required String? text}) async {
    if (text != null && text.isNotEmpty) {
      await _sharedPreferencesService.deleteList(key: keyShared);

      List<String> values = [];
      crud.listText.forEach((element) => values.add(element.text!));
      await _sharedPreferencesService.saveList(key: keyShared, value: values);
    }
  }
}
