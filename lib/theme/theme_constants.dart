import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ThemeConstants {
  // Spacing
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;

  // Border Radius
  static const BorderRadius smallRadius = BorderRadius.all(Radius.circular(7.0)); // Very small border radius
  static const BorderRadius mediumRadius = BorderRadius.all(Radius.circular(7.0)); // Also set to 6.0 for consistency

  // Elevation
  static const double cardElevation = 4.0;
  static const double buttonElevation = 2.0;

  // Animation Durations
  static const Duration shortDuration = Duration(milliseconds: 200);
  static const Duration mediumDuration = Duration(milliseconds: 400);
  static const Duration longDuration = Duration(milliseconds: 600);

  // Button and TextField Dimensions
  static const double textFieldWidth = 320.0; // Adjusted width for text fields and buttons
  static const double buttonHeight = 50.0; // Standard height for buttons

  // Background Image Size
  static const double backgroundImageHeight = 200.0; // Standard height for background images
  static const double backgroundImageWidth = double.infinity; // Full width for background images

  // Screen Padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

  // Icon Size
  static const double iconSize = 24.0;
}
