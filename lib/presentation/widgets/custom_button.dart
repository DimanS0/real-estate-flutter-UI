import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/theme_constants.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
    this.color = const Color(0xFF2D3E5B), // Updated to the specified color
    this.textColor = Colors.white, // Default text color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ThemeConstants.textFieldWidth, // Use constant width from ThemeConstants
      height: ThemeConstants.buttonHeight,  // Use constant height from ThemeConstants
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: const RoundedRectangleBorder(
            borderRadius: ThemeConstants.mediumRadius,
          ),
          backgroundColor: color,
          disabledBackgroundColor: Colors.grey,
          elevation: ThemeConstants.buttonElevation, // Use constant elevation from ThemeConstants
        ),
        onPressed: isLoading ? null : onPressed, // Disable button if loading
        child: isLoading
            ? SpinKitThreeBounce(
          color: textColor,
          size: 20.0,
        )
            : Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: textColor,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
