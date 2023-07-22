import 'package:mobx/mobx.dart';

import '../../shared_preferences/notes_prefs.dart';
import '../models/note.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  @observable
  ObservableList<Note> notes = ObservableList<Note>();

  @observable
  String searchTitle = '';

  @observable
  bool searchModeOn = false;

  @computed
  ObservableList<Note> get filteredNotes {
    return ObservableList.of(
      notes.where((note) =>
          note.title.toLowerCase().contains(searchTitle.toLowerCase())),
    );
  }

  @action
  void removeNote(String id) {
    notes.removeWhere((element) => element.id == id);
    NotesPrefs.removeNote(id);
  }

  @action
  getNotes() {
    notes = ObservableList.of(NotesPrefs.getAllNotes());
  }

  @action
  setSearchMode() {
    searchModeOn = !searchModeOn;
  }
}
