import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xff2F45CA);
const Color blackColor = Color(0xff18182C);
const Color greyColor = Color(0xff6B6B6B);
const Color backgroundColor = Color(0xffF9F9F9);
final List<FlexibleTrackSize> twelveGrid = [1.0.fr,1.0.fr,1.0.fr,1.0.fr,1.0.fr,1.0.fr,1.0.fr,1.0.fr,1.0.fr,1.0.fr,1.0.fr,1.0.fr];

ThemeData bazarPopularTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff2F45CA), // Your main color
    fontFamily: 'Inter', // Your chosen font
    textTheme: GoogleFonts.interTextTheme(const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.normal,color: blackColor),
        bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: blackColor),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: blackColor),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
    cardTheme:
        const CardTheme(color: Colors.white, shadowColor: Color(0x26000000)),
    navigationDrawerTheme: const NavigationDrawerThemeData(
      backgroundColor: Colors.white,
      indicatorColor: backgroundColor
),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      surface: backgroundColor
),
    useMaterial3: true);

Map<String, ButtonStyle> buttonStyles = {
  'primary': ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 24)),
      backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
)
)),
  'textButton': ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 24)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
)
)),
  'outlined': ButtonStyle(
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(color: primaryColor, width: 2)
),
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 24)),
      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF9C9C9C).withAlpha(3)),
      foregroundColor: WidgetStateProperty.all<Color>(primaryColor),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
)
        
))

};
