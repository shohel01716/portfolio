import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/values/values.dart';
import 'package:google_fonts/google_fonts.dart';



class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: white),
      canvasColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        color: primaryColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: black,
        selectionColor: textSelectionColor,
        selectionHandleColor: primaryColor,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primaryColor,
    primaryVariant: primaryColor,
    secondary: secondaryColor,
    secondaryVariant: black,
    background: primaryColor,
    surface: primaryColor,
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w600;
  static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_96,
      color: black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      fontFamily: VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_60,
      color: black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: Sizes.TEXT_SIZE_48,
      color: black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      fontFamily: VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_34,
      color: black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: Sizes.TEXT_SIZE_24,
      color: black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      fontFamily: VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_20,
      color: black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      fontFamily: VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_16,
      color: secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: Sizes.TEXT_SIZE_14,
      color: secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      fontFamily: VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_16,
      color: secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: Sizes.TEXT_SIZE_14,
      color: secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    button: GoogleFonts.roboto(
      fontSize: Sizes.TEXT_SIZE_14,
      color: secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: _medium,
    ),
    caption: TextStyle(
      fontFamily: VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_12,
      color: white,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
  );
}
