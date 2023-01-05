import 'package:calendz_app/theme/input_decoration_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import 'button_theme.dart';
import 'checkbox_themedata.dart';
import 'theme_data.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    primarySwatch: primaryMaterialColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: blackColor,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: GoogleFonts.plusJakartaSansTextTheme(),
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonTheme(borderColor: whileColor20),
    textButtonTheme: textButtonThemeData,
    inputDecorationTheme: darkInputDecorationTheme,
    checkboxTheme: checkboxThemeData,
    appBarTheme: appBarDarkTheme,
    scrollbarTheme: scrollbarThemeData,
    dataTableTheme: dataTableDarkThemeData,
  );
}
