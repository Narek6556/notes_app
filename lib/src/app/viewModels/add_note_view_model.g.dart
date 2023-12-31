// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNewNoteViewModel on AddNewNoteViewModelBase, Store {
  late final _$titleAtom =
      Atom(name: 'AddNewNoteViewModelBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'AddNewNoteViewModelBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$AddNewNoteViewModelBaseActionController =
      ActionController(name: 'AddNewNoteViewModelBase', context: context);

  @override
  void save() {
    final _$actionInfo = _$AddNewNoteViewModelBaseActionController.startAction(
        name: 'AddNewNoteViewModelBase.save');
    try {
      return super.save();
    } finally {
      _$AddNewNoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote(Note note) {
    final _$actionInfo = _$AddNewNoteViewModelBaseActionController.startAction(
        name: 'AddNewNoteViewModelBase.updateNote');
    try {
      return super.updateNote(note);
    } finally {
      _$AddNewNoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNote(String id) {
    final _$actionInfo = _$AddNewNoteViewModelBaseActionController.startAction(
        name: 'AddNewNoteViewModelBase.removeNote');
    try {
      return super.removeNote(id);
    } finally {
      _$AddNewNoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description}
    ''';
  }
}
