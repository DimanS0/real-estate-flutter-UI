import 'package:flutter/material.dart';
import '../../theme/theme_constants.dart';



class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? icon; // Make the icon optional
  final bool isPasswordField;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon, // Icon is now optional
    this.isPasswordField = false,
    required this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ThemeConstants.textFieldWidth, // Set width to match the button
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPasswordField ? _isObscured : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins',
            color: Colors.grey[500],
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: ThemeConstants.mediumPadding,
            vertical: ThemeConstants.smallPadding,
          ),
          border: OutlineInputBorder(
            borderRadius: ThemeConstants.mediumRadius,
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: ThemeConstants.mediumRadius,
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: ThemeConstants.mediumRadius,
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: widget.isPasswordField
              ? IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey[500],
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          )
              : widget.icon != null
              ? Icon(widget.icon, color: Colors.grey[500])
              : null, // If no icon is provided, no suffixIcon is shown
        ),
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
      ),
    );
  }
}
