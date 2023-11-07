// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Crud on _Crud, Store {
  late final _$listTextAtom = Atom(name: '_Crud.listText', context: context);

  @override
  ObservableList<TextData> get listText {
    _$listTextAtom.reportRead();
    return super.listText;
  }

  @override
  set listText(ObservableList<TextData> value) {
    _$listTextAtom.reportWrite(value, super.listText, () {
      super.listText = value;
    });
  }

  late final _$initTextListAsyncAction =
      AsyncAction('_Crud.initTextList', context: context);

  @override
  Future<void> initTextList() {
    return _$initTextListAsyncAction.run(() => super.initTextList());
  }

  late final _$_CrudActionController =
      ActionController(name: '_Crud', context: context);

  @override
  void addText({required String text}) {
    final _$actionInfo =
        _$_CrudActionController.startAction(name: '_Crud.addText');
    try {
      return super.addText(text: text);
    } finally {
      _$_CrudActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeText({required int id}) {
    final _$actionInfo =
        _$_CrudActionController.startAction(name: '_Crud.removeText');
    try {
      return super.removeText(id: id);
    } finally {
      _$_CrudActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editText({required int id, required String value}) {
    final _$actionInfo =
        _$_CrudActionController.startAction(name: '_Crud.editText');
    try {
      return super.editText(id: id, value: value);
    } finally {
      _$_CrudActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listText: ${listText}
    ''';
  }
}
