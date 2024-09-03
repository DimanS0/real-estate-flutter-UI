import 'package:flutter/material.dart';

class AppTheme {
  // Common Dark Blue Color for Buttons
  static const Color buttonColor = Color(0xFF2A3B5B); // Dark Blue

  // Light Theme Configuration
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white, // Background color for Scaffold
    primaryColor: Colors.grey[300], // Low light white
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[300], // Low light white AppBar color
      iconTheme: const IconThemeData(color: Colors.black), // Icon color in AppBar
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ), // Title color in AppBar
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[300], // Low light white FAB color
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black, // Main text color
        fontFamily: 'Poppins',
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.black87, // Secondary text color
        fontFamily: 'Poppins',
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        color: Colors.white, // Button text color
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, // Dark Blue Button color
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );

  // Dark Theme Configuration
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black, // Background color for Scaffold
    primaryColor: Colors.grey[850], // Dark grey for a low light white effect
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850], // Dark grey AppBar color
      iconTheme: const IconThemeData(color: Colors.white), // Icon color in AppBar
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ), // Title color in AppBar
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[850], // Dark grey FAB color
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white, // Main text color
        fontFamily: 'Poppins',
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.white70, // Secondary text color
        fontFamily: 'Poppins',
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        color: Colors.white, // Button text color
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, // Dark Blue Button color
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
