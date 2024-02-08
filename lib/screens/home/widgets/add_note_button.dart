import 'package:comitons_test/theme/colors.dart';
import 'package:flutter/material.dart';

class AddNoteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddNoteButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 50,
        width: 100,
        child: FloatingActionButton(
          backgroundColor: StyleguideColors.primaryPurple,
          onPressed: onPressed,
          child: const Text(
            'Додати',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
