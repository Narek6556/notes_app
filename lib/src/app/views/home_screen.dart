import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes_app/src/app/viewModels/home_view_model.dart';
import 'package:notes_app/src/app/views/add_new_note_screen.dart';
import 'package:notes_app/src/app/widgets/header_section.dart';
import 'package:notes_app/src/app/widgets/note_card.dart';
import 'package:notes_app/src/app/widgets/search_bar.dart';
import 'package:notes_app/src/themes/themes.dart';
import 'package:provider/provider.dart';

import '../../themes/color_utils.dart';
import '../models/note.dart';
import '../widgets/icon_container.dart';
import '../widgets/svg_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _viewModel = Provider.of<HomeViewModel>(context);
    _viewModel.getNotes();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtils.rgbToColor(59, 59, 59, 1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewNoteScreen()),
          );
        },
        tooltip: 'add new note',
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Observer(builder: (_) {
              return !_viewModel.searchModeOn
                  ? HeaderSection(
                      left: Text(
                        'Notes',
                        style: TextStyle(
                            fontSize: 43,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      right: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: IconContainer(icon: searchIcon),
                            onTap: () {
                              _viewModel.setSearchMode();
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconContainer(icon: infoLight),
                        ],
                      ),
                    )
                  : SearchBar();
            }),
            Expanded(
              child: Observer(
                builder: (_) {
                  List<Note> notes = _viewModel.searchModeOn
                      ? _viewModel.filteredNotes
                      : _viewModel.notes;
                  if (notes.isEmpty) {
                    return Center(
                      child: _viewModel.searchModeOn
                          ? Column(
                              children: [
                                Image.asset(
                                  'assets/images/empty_search.png',
                                  width: 250,
                                  height: 250,
                                ),
                                Text(
                                  'File not found. Try searching again.',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onButton,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            )
                          : Image.asset(
                              'assets/images/empty_notes.png',
                              width: 250,
                              height: 250,
                            ),
                    );
                  }
                  return ListView.builder(
                    itemCount: _viewModel.searchModeOn
                        ? _viewModel.filteredNotes.length
                        : _viewModel.notes.length,
                    itemBuilder: (context, index) {
                      Note note = _viewModel.searchModeOn
                          ? _viewModel.filteredNotes[index]
                          : _viewModel.notes[index];
                      return Dismissible(
                        background: Padding(
                          padding: const EdgeInsets.only(
                              top: 17, right: 24, left: 24),
                          child: Container(
                            width: double.infinity,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.error,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.delete,
                                color: Theme.of(context).colorScheme.onError,
                              ),
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          _viewModel.removeNote(note.id);
                        },
                        key: Key(note.id),
                        child: NoteCard(
                          note: note,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
