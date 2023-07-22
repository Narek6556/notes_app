import 'package:flutter/material.dart';
import 'package:notes_app/src/themes/themes.dart';

class ButtonSwitch extends StatelessWidget {
  const ButtonSwitch(
      {super.key, required this.isSelected, required this.title});

  final bool isSelected;
  final String title;

  BoxDecoration _boxDecoration(Color color) => BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      decoration: isSelected
          ? _boxDecoration(Theme.of(context).colorScheme.primaryContainer)
          : null,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSelected
              ? Theme.of(context).colorScheme.onButton
              : Theme.of(context).colorScheme.brightness == Brightness.dark
                  ? Theme.of(context).colorScheme.onButton
                  : Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
