import 'package:comitons_test/theme/colors.dart';
import 'package:flutter/material.dart';

class NoteButtonPurple extends StatelessWidget {
  final String title;
  final String heroTag;
  final VoidCallback onPressed;

  const NoteButtonPurple({
    Key? key,
    required this.title,
    required this.heroTag,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: StyleguideColors.primaryPurple,
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
