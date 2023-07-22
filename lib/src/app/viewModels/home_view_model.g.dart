// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$notesAtom =
      Atom(name: 'HomeViewModelBase.notes', context: context);

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$searchTitleAtom =
      Atom(name: 'HomeViewModelBase.searchTitle', context: context);

  @override
  String get searchTitle {
    _$searchTitleAtom.reportRead();
    return super.searchTitle;
  }

  @override
  set searchTitle(String value) {
    _$searchTitleAtom.reportWrite(value, super.searchTitle, () {
      super.searchTitle = value;
    });
  }

  late final _$searchModeOnAtom =
      Atom(name: 'HomeViewModelBase.searchModeOn', context: context);

  @override
  bool get searchModeOn {
    _$searchModeOnAtom.reportRead();
    return super.searchModeOn;
  }

  @override
  set searchModeOn(bool value) {
    _$searchModeOnAtom.reportWrite(value, super.searchModeOn, () {
      super.searchModeOn = value;
    });
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  void removeNote(String id) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.removeNote');
    try {
      return super.removeNote(id);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getNotes() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.getNotes');
    try {
      return super.getNotes();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchMode() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.setSearchMode');
    try {
      return super.setSearchMode();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
searchTitle: ${searchTitle},
searchModeOn: ${searchModeOn}
    ''';
  }
}
