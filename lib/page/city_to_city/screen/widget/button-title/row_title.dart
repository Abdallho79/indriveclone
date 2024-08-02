import 'package:flutter/material.dart';

class RowTitle extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const RowTitle({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
              icon: const Icon(
                Icons.close,
              ),
              onPressed: onPressed),
        ),
      ],
    );
  }
}
