import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xff2F45CA);
const Color backgroundColor = Color(0xffFAFAFA);
ThemeData bazarPopularTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff2F45CA), // Your main color
    fontFamily: 'Inter', // Your chosen font
    textTheme:  GoogleFonts.interTextTheme(
        const TextTheme(
            displayLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
            displaySmall: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.normal),
            bodyMedium: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
            headlineLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.w900),
            headlineMedium: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),
            headlineSmall: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)
        )
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: Color(0x26000000)
    ),
    navigationDrawerTheme: const NavigationDrawerThemeData(
      backgroundColor: Colors.white,
      indicatorColor: backgroundColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor ,
      surface: backgroundColor ,
      ),
    useMaterial3: true
);
