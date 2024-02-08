import 'package:comitons_test/theme/app_theme.dart';
import 'package:flutter/material.dart';


import 'colors.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelSmall => textTheme.labelSmall!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;
  // Japanese
  TextStyle get bodyLargeJP => AppTheme.bodyLargeJPStyle;
}

extension TextStyleExtensions on TextStyle {
  TextStyle textColor(Color? color) => copyWith(color: color);
  TextStyle get brandColor => copyWith(color: StyleguideColors.primaryPurple);
  TextStyle get white => copyWith(color: StyleguideColors.white);
  TextStyle get underline => copyWith(
        decoration: TextDecoration.underline,
      );
  TextStyle get ellipsis => copyWith(overflow: TextOverflow.ellipsis);
}
