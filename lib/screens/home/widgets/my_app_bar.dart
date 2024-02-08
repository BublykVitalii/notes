import 'package:comitons_test/theme/colors.dart';
import 'package:comitons_test/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: StyleguideColors.complimentaryHoverPurple,
      foregroundColor: StyleguideColors.white,
      title: Text(title),
      elevation: 0,
    );
  }
}
