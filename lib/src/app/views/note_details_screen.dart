import 'package:flutter/material.dart';
import 'package:notes_app/src/app/viewModels/add_note_view_model.dart';
import 'package:notes_app/src/app/widgets/icon_container.dart';
import 'package:notes_app/src/app/widgets/svg_icons.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../widgets/header_section.dart';
import 'edit_note_screen.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({
    super.key,
    required this.note,
    required this.screenName,
  });

  final Note note;
  final String screenName;

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  late final AddNewNoteViewModel _viewModel;

  @override
  void didChangeDependencies() {
    // TODO: implement initState
    _viewModel = Provider.of<AddNewNoteViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(
              left: GestureDetector(
                child: IconContainer(icon: left),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              right: GestureDetector(
                child: IconContainer(icon: pencil),
                onTap: () {
                  //TODO: check if screen was redirected from AddNewNote then redirect it back
                  if (widget.screenName == 'add_new_note_screen') {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNoteScreen(note: widget.note),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.note.title,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    widget.note.description,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
