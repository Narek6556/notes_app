import 'package:flutter/material.dart';
import 'package:notes_app/src/themes/themes.dart';

import '../../app/widgets/svg_icons.dart';

class ToastMessage extends StatelessWidget {
  ToastMessage({super.key, required this.isSuccess, required this.message});
  final bool isSuccess;

  final String message;

  @override
  Widget build(BuildContext context) {
    String title = isSuccess ? 'Well done!' : 'Error!';
    print(Theme.of(context).colorScheme.error);
    return Container(
      decoration: BoxDecoration(
        color: isSuccess
            ? Theme.of(context).colorScheme.success
            : Theme.of(context).colorScheme.onError,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      width: 260,
      height: 95,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSuccess ? successIcon : errorIcon,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSuccess,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 155,
                child: Text(
                  message,
                  softWrap: true,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSuccess,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          closeIcon,
        ],
      ),
    );
  }
}
