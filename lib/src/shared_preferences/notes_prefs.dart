import 'dart:convert';

import 'package:notes_app/src/shared_preferences/auth_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/models/note.dart';

enum NoteKeys {
  notes,
}

class NotesPrefs {
  static late final SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static void addNote(Note note) {
    String userId = _prefs.getString(StoreKeys.token.toString())!;
    List<String>? notes = _prefs.getStringList('$userId-${NoteKeys.notes}');

    if (notes == null) {
      List<String> newNotes = [];
      newNotes.add(jsonEncode(note.toJson()));
      _prefs.setStringList('$userId-${NoteKeys.notes}', newNotes);
    } else {
      notes.add(jsonEncode(note.toJson()));
      _prefs.setStringList('$userId-${NoteKeys.notes}', notes);
    }
  }

  static void updateNote(Note note) {
    String userId = _prefs.getString(StoreKeys.token.toString())!;
    List<String>? notesString =
        _prefs.getStringList('$userId-${NoteKeys.notes}');

    if (notesString != null) {
      for (int i = 0; i < notesString.length; i++) {
        Note storedNote = Note.fromJson(jsonDecode(notesString[i]));
        if (storedNote.id == note.id) {
          print('Old title -> ${storedNote.title}');
          print('New title -> ${note.title}');
          notesString[i] = jsonEncode(note.toJson());
        }
      }
      _prefs.setStringList('$userId-${NoteKeys.notes}', notesString);
    }
  }

  static List<Note> getAllNotes() {
    String userId = _prefs.getString(StoreKeys.token.toString())!;
    List<String>? notesString =
        _prefs.getStringList('$userId-${NoteKeys.notes}');
    List<Note> notes = [];

    if (notesString != null) {
      for (String note in notesString) {
        notes.add(Note.fromJson(jsonDecode(note)));
      }
    }
    return notes;
  }

  static void removeNote(String id) {
    String userId = _prefs.getString(StoreKeys.token.toString())!;
    List<String>? notesString =
        _prefs.getStringList('$userId-${NoteKeys.notes}');
    List<Note> notes = [];

    if (notesString != null) {
      for (String noteString in notesString) {
        Note note = Note.fromJson(jsonDecode(noteString));
        if (note.id != id) {
          notes.add(note);
        }
      }
      List<String> newNotes = [];
      for (Note note in notes) {
        String noteString = jsonEncode(note.toJson());
        newNotes.add(noteString);
      }
      _prefs.setStringList('$userId-${NoteKeys.notes}', newNotes);
    }
  }

  static cleanAuth() {
    _prefs.clear();
  }
}
