import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:prova_flutter/core/models/text_data.dart';
import 'package:prova_flutter/core/services/local_data/shared_preferences.dart';

import '../../../core/conts/conts.dart';
part 'crud.g.dart';

class Crud = _Crud with _$Crud;

abstract class _Crud with Store {
  @observable
  var listText = ObservableList<TextData>();

  @action
  Future<void> initTextList() async {
    listText.clear();
    await SharedPreferencesService().readList(key: keyShared).then((value) {
      value.forEach((element) {
        listText.add(TextData(text: element, id: Random().nextInt(700)));
      });
    });
  }

  @action
  void addText({required String text}) {
    listText.add(TextData(text: text, id: Random().nextInt(700)));
  }

  @action
  void removeText({required int id}) {
    listText.removeWhere((element) => element.id == id);
  }

  @action
  void editText({required int id, required String value}) {
    listText.removeWhere((element) => element.id == id);

    addText(text: value);
  }
}
