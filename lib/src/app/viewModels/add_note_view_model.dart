import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../shared_preferences/notes_prefs.dart';
import '../models/note.dart';

part 'add_note_view_model.g.dart';

class AddNewNoteViewModel = AddNewNoteViewModelBase with _$AddNewNoteViewModel;

abstract class AddNewNoteViewModelBase with Store {
  List<String> colors = <String>[
    '#FF9E9E',
    '#91F48F',
    '#FFF599',
    '#9EFFFF',
    '#B69CFF',
  ];

  @observable
  String title = '';

  @observable
  String description = '';

  @action
  void save() {
    int index = Random().nextInt(5);
    Note newNote = Note(
      title: title,
      description: description,
      color: colors[index],
    );
    NotesPrefs.addNote(newNote);
  }

  @action
  void updateNote(Note note) {
    print('Print');
    NotesPrefs.updateNote(note);
  }

  @action
  void removeNote(String id) {
    // notes.removeWhere((element) => element.id == id);
  }
}
