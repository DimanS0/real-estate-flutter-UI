import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.accentColor,
  );

  static const TextStyle headline2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.accentColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.accentColor,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.accentColor,
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.accentColor,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.accentColor,
  );
}
