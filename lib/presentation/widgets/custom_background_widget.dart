import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class CustomBackgroundScreen extends StatelessWidget {
  final String headerImagePath;
  final Widget content;
  final bool showIcons;

  const CustomBackgroundScreen({
    super.key,
    required this.headerImagePath,
    required this.content,
    this.showIcons = true, // Control the visibility of icons
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header Image covering the top half of the screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5, // Half of the screen height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(headerImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Custom Container on top of the image
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% of the screen width
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1.0), // Solid white background
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5.0,
                    offset: const Offset(0, 2), // Shadow position
                  ),
                ],
              ),
              child: content,
            ),
          ),
          // Social Media Icons at the bottom (conditionally displayed)
          if (showIcons)
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.xTwitter, size: 18),
                    onPressed: null,
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.facebookF, size: 18),
                    onPressed: null,
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram, size: 18),
                    onPressed: null,
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.google, size: 18),
                    onPressed: null,
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.linkedinIn, size: 18),
                    onPressed: null,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
