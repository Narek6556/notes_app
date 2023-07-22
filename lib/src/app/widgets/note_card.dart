import 'package:flutter/material.dart';
import 'package:notes_app/src/app/views/note_details_screen.dart';
import 'package:notes_app/src/themes/color_utils.dart';
import 'package:notes_app/src/themes/themes.dart';

import '../models/note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17, right: 24, left: 24),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoteDetailsScreen(note: note)),
          );
        },
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorUtils.hexToColor(note.color),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 28),
                child: Text(
                  note.title,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.text,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
