import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xff2F45CA);
const Color blackColor = Color(0xff18182C);
const Color backgroundColor = Color(0xffF9F9F9);
ThemeData bazarPopularTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff2F45CA), // Your main color
    fontFamily: 'Inter', // Your chosen font
    textTheme: GoogleFonts.interTextTheme(const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
    cardTheme:
        const CardTheme(color: Colors.white, shadowColor: Color(0x26000000)),
    navigationDrawerTheme: const NavigationDrawerThemeData(
      backgroundColor: Colors.white,
      indicatorColor: backgroundColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      surface: backgroundColor,
    ),
    useMaterial3: true);

Map<String, ButtonStyle> buttonStyles = {
  'primary': ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 20, horizontal: 24)),
      backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      )),
  'textButton': ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 20, horizontal: 24)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      )),
  'outlined': ButtonStyle(
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(color: primaryColor, width: 2)
    ),
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 24)),
      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF9C9C9C).withOpacity(0.01)),
      foregroundColor: WidgetStateProperty.all<Color>(primaryColor),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        
      ))

};
