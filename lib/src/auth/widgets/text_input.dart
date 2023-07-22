import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hint,
    required this.errorMessage,
    required this.onChange,
  });

  final String hint;
  final String? errorMessage;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 65,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          obscureText: hint.toLowerCase() == 'password',
          onChanged: (value) => onChange(value),
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.primary,
            errorText: errorMessage,
            errorStyle: TextStyle(color: Theme.of(context).errorColor),
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
