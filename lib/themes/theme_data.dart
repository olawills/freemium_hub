import 'package:flutter/material.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LightThemeData {
  static final lightTheme = ThemeData(
    backgroundColor: LightThemeColors.textButtonColor,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: LightThemeColors.lightThemeAppbar,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headline5: TextStyle(
        color: LightThemeColors.textColors,
        fontSize: 15,
      ),
      headline6: GoogleFonts.lato(
        color: LightThemeColors.textColors,
        fontSize: 18,
      ),
      bodyText1: GoogleFonts.roboto(
        color: LightThemeColors.textColors,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: IconThemeData(
      color: LightThemeColors.iconColor,
    ),
  );
}

class DarkThemeData {
  static final darkTheme = ThemeData(
    splashColor: DarkThemeColors.darkThemeAppbar,
    scaffoldBackgroundColor: DarkThemeColors.bodyColor,
    iconTheme: IconThemeData(
      color: DarkThemeColors.iconColor,
    ),
    backgroundColor: DarkThemeColors.bottomNavBarColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: DarkThemeColors.selectedIconColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkThemeColors.bottomNavBarColor,
      selectedItemColor: DarkThemeColors.selectedIconColor,
      unselectedItemColor: DarkThemeColors.unSelectedIconColor,
    ),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkThemeColors.darkThemeAppbar,
    ),
    textTheme: TextTheme(
      headline6: GoogleFonts.lato(
        color: DarkThemeColors.textColors,
        fontSize: 16,
      ),
      bodyText1: GoogleFonts.roboto(
        color: DarkThemeColors.textColors,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.lato(
        color: DarkThemeColors.textColors,
        fontSize: 17,
      ),
      headline5: GoogleFonts.lato(
        color: DarkThemeColors.selectedIconColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headline3: GoogleFonts.lato(
        color: DarkThemeColors.textColors,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
