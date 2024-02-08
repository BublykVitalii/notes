import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static double fieldBorderWidth = 1;

  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: StyleguideColors.white,
    disabledColor: StyleguideColors.charcoalGrey,
    dividerColor: StyleguideColors.secondaryLightGrey01,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: StyleguideColors.primaryPurple,
      primaryContainer: StyleguideColors.complimentaryHoverPurple,
      onPrimary: StyleguideColors.white,
      secondary: StyleguideColors.primaryBrandYellow,
      onSecondary: StyleguideColors.primaryPurple,
      onSecondaryContainer: StyleguideColors.secondaryDarkGrey,
      error: StyleguideColors.statusErrorRed,
      onError: StyleguideColors.white,
      background: StyleguideColors.white,
      onBackground: StyleguideColors.black,
      surface: StyleguideColors.white,
      onSurface: StyleguideColors.black,
      tertiary: StyleguideColors.secondaryLightGrey,
      onTertiary: StyleguideColors.black,
      tertiaryContainer: StyleguideColors.secondaryLightPurple,
      onTertiaryContainer: StyleguideColors.black,
    ),
    fontFamily: 'NotoSans',
    textSelectionTheme: const TextSelectionThemeData(cursorColor: StyleguideColors.black),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: StyleguideColors.secondaryGrey),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: fieldBorderWidth,
          color: StyleguideColors.statusErrorRed,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: fieldBorderWidth,
          color: StyleguideColors.statusErrorRed,
        ),
      ),
      errorMaxLines: 2,
      errorStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontStyle: FontStyle.italic,
        height: 1.5,
        color: StyleguideColors.statusErrorRed,
      ),
      suffixStyle: const TextStyle(textBaseline: TextBaseline.alphabetic),
      suffixIconColor: StyleguideColors.charcoalGrey,
      prefixIconColor: StyleguideColors.charcoalGrey,
      hintStyle: bodyLargeStyle.copyWith(color: StyleguideColors.secondaryLightGrey04),
      labelStyle: floatingLabelStyle,
      alignLabelWithHint: true,
      floatingLabelStyle: floatingLabelStyle,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      iconColor: StyleguideColors.black,
      tileColor: StyleguideColors.white,
    ),
    textTheme: TextTheme(
      displayLarge: displayLargeStyle,
      displayMedium: displayMediumStyle,
      displaySmall: displaySmallStyle,
      headlineSmall: headlineSmallStyle,
      titleLarge: titleLargeStyle,
      titleMedium: titleMediumStyle,
      labelLarge: labelLargeStyle,
      labelMedium: labelMediumStyle,
      bodyLarge: bodyLargeStyle,
      bodyMedium: bodyMediumStyle,
      bodySmall: bodySmallStyle,
    ).apply(
      bodyColor: StyleguideColors.black,
    ),
  );

  static TextStyle displayLargeStyle = const TextStyle(
    fontSize: 42,
    height: 1,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle displayMediumStyle = const TextStyle(
    fontSize: 28,
    height: 32 / 28,
    fontFamily: 'NotoSans-Medium',
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle displaySmallStyle = const TextStyle(
    fontSize: 24,
    height: 30 / 24,
    fontFamily: 'NotoSans-Medium',
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle headlineSmallStyle = const TextStyle(
    fontSize: 21,
    height: 30 / 21,
    fontFamily: 'NotoSans-Medium',
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle titleLargeStyle = const TextStyle(
    fontSize: 16,
    height: 26 / 16,
    fontFamily: 'NotoSans-SemiBold',
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle titleMediumStyle = const TextStyle(
    fontSize: 16,
    height: 26 / 16,
    fontFamily: 'NotoSans-Light',
    fontFamilyFallback: ['NotoSansJP-Light'],
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle labelLargeStyle = const TextStyle(
    fontSize: 14,
    height: 22 / 14,
    fontFamily: 'NotoSans-SemiBold',
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle labelMediumStyle = const TextStyle(
    fontSize: 14,
    height: 22 / 14,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle floatingLabelStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1,
    leadingDistribution: TextLeadingDistribution.even,
    color: StyleguideColors.primaryPurple,
  );

  static TextStyle floatingLabelDisabledStyle = floatingLabelStyle.copyWith(
    color: StyleguideColors.charcoalGrey,
  );

  static TextStyle hideFieldUnderlineErrorStyle = const TextStyle(
    height: 0.01,
    color: Colors.transparent,
  );
  static InputBorder hideFieldUnderlineBorderErrorStyle = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  );

  static TextStyle bodyLargeStyle = const TextStyle(
    fontSize: 16,
    height: 26 / 16,
    fontFamily: 'NotoSans-Light',
    fontFamilyFallback: ['NotoSansJP-Light'],
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle bodyLargeJPStyle = const TextStyle(
    fontSize: 16,
    height: 26 / 16,
    fontFamily: 'NotoSansJP-Light',
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle bodyMediumStyle = const TextStyle(
    fontSize: 14,
    height: 22 / 14,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle bodySmallStyle = const TextStyle(
    fontSize: 10,
    height: 15 / 10,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final BoxShadow cardShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.15),
    spreadRadius: 1,
    blurRadius: 3,
    offset: const Offset(0, 1),
  );

  static TextStyle displaySmallItalic = const TextStyle(
    fontSize: 14,
    height: 22 / 14,
    fontStyle: FontStyle.italic,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
