import 'package:calendz_app/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:calendz_app/theme/checkbox_themedata.dart';

import '../constants/constants.dart';
import 'button_theme.dart';
import 'input_decoration_theme.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: primaryMaterialColor,
    primaryColor: primaryColor,
    secondaryHeaderColor: blackColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: blackColor),
    textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
      headline1: GoogleFonts.plusJakartaSansTextTheme().headline1!.copyWith(
            color: blackColor,
          ),
      headline2: GoogleFonts.plusJakartaSansTextTheme().headline2!.copyWith(
            color: blackColor,
          ),
      headline3: GoogleFonts.plusJakartaSansTextTheme().headline3!.copyWith(
            color: blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
      headline4: GoogleFonts.plusJakartaSansTextTheme().headline4!.copyWith(
            color: blackColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
      headline5: GoogleFonts.plusJakartaSansTextTheme().headline5!.copyWith(
            color: blackColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
      headline6: GoogleFonts.plusJakartaSansTextTheme().headline6!.copyWith(
            color: blackColor,
            fontSize: 17,
          ),
      subtitle1: GoogleFonts.plusJakartaSansTextTheme().subtitle1!.copyWith(
            color: blackColor,
            fontSize: 19,
          ),
      subtitle2: GoogleFonts.plusJakartaSansTextTheme().subtitle2!.copyWith(
            color: blackColor,
            fontSize: 18,
          ),
      bodyText1: GoogleFonts.plusJakartaSansTextTheme().bodyText1!.copyWith(
            color: blackColor,
            fontSize: 16,
          ),
      bodyText2: GoogleFonts.plusJakartaSansTextTheme().bodyText2!.copyWith(
            color: blackColor,
            fontSize: 14,
          ),
    ),
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonTheme(),
    textButtonTheme: textButtonThemeData,
    inputDecorationTheme: lightInputDecorationTheme,
    checkboxTheme: checkboxThemeData.copyWith(
      side: const BorderSide(color: blackColor40),
    ),
    unselectedWidgetColor: blackColor50,
    appBarTheme: appBarLightTheme,
    scrollbarTheme: scrollbarThemeData,
    dataTableTheme: dataTableLightThemeData,
  );
}
