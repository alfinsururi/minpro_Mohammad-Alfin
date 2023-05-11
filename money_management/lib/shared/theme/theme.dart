import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get defaultTheme {
  return ThemeData(
    primaryColor: Colors.indigo,
    fontFamily: GoogleFonts.roboto().fontFamily,
    scaffoldBackgroundColor: Colors.grey[200],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.indigo,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: GoogleFonts.robotoTextTheme(
      const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.indigo,
      secondary: Colors.pinkAccent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey[600],
      backgroundColor: Colors.white,
      elevation: 0,
      selectedLabelStyle:const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
