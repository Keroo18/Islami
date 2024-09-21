import 'package:flutter/material.dart';

class ApplicationThemeManagement{
  static const Color primaryColor=Color(0xFFB7935F);
  static const Color primaryDarkColor=Color(0xFFFACC1D);
  static ThemeData lightThemeData =ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 25,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Color(0xFFF8F8F8),
      selectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 35,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFF8F8F8),
        size: 28,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),

    ),
    dividerTheme: DividerThemeData(
      color: primaryColor,
    ),
  );
  static ThemeData darkThemeData =ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 25,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,

      ),
      titleMedium: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.white,

      ),
      titleSmall: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,

      ),
      bodySmall: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.white,

      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF141A2E),
      selectedItemColor: Colors.amber,
      unselectedItemColor: Color(0xFFF8F8F8),
      selectedIconTheme: IconThemeData(
        color: Colors.amber,
        size: 35,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFF8F8F8),
        size: 28,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.white,

      ),

    ),
    dividerTheme: DividerThemeData(
      color: primaryDarkColor,
    ),
  );
}