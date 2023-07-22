import 'package:flutter/material.dart';
import 'package:notes_app/src/app/viewModels/add_note_view_model.dart';
import 'package:notes_app/src/app/viewModels/home_view_model.dart';
import 'package:notes_app/src/app/views/home_screen.dart';
import 'package:notes_app/src/app/widgets/icon_container.dart';
import 'package:notes_app/src/app/widgets/svg_icons.dart';
import 'package:notes_app/src/themes/color_utils.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../widgets/header_section.dart';
import 'note_details_screen.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});

  final Note note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
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
          children: [
            HeaderSection(
              left: GestureDetector(
                child: IconContainer(icon: left),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              right: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: IconContainer(icon: visibility),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteDetailsScreen(
                            note: Note(
                              title: _viewModel.title,
                              description: _viewModel.description,
                              color: '#FFFFFF',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: IconContainer(icon: save),
                    onTap: () {
                      widget.note.title = _viewModel.title;
                      widget.note.description = _viewModel.description;
                      _viewModel.updateNote(widget.note);
                      Provider.of<HomeViewModel>(context, listen: false)
                          .getNotes();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => _viewModel.title = value,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: TextEditingController(text: widget.note.title),
                    maxLength: 14,
                    maxLines: 2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: ColorUtils.rgbToColor(154, 154, 154, 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    onChanged: (value) => _viewModel.description = value,
                    controller:
                        TextEditingController(text: widget.note.description),
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 13,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something...',
                      hintStyle: TextStyle(
                        color: ColorUtils.rgbToColor(154, 154, 154, 1),
                      ),
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
