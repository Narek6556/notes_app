import 'package:flutter/material.dart';
import 'package:notes_app/src/app/viewModels/add_note_view_model.dart';
import 'package:notes_app/src/app/viewModels/home_view_model.dart';
import 'package:notes_app/src/app/widgets/icon_container.dart';
import 'package:notes_app/src/app/widgets/svg_icons.dart';
import 'package:notes_app/src/themes/color_utils.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../widgets/header_section.dart';
import 'note_details_screen.dart';

class AddNewNoteScreen extends StatefulWidget {
  const AddNewNoteScreen({
    super.key,
  });

  @override
  State<AddNewNoteScreen> createState() => _AddNewNoteScreenState();
}

class _AddNewNoteScreenState extends State<AddNewNoteScreen> {
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
                      _viewModel.save();
                      Provider.of<HomeViewModel>(context, listen: false)
                          .getNotes();
                      Navigator.of(context).pop();
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
