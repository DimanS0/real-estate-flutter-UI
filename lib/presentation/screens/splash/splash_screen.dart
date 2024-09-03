import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../theme/theme_constants.dart'; // Ensure you have this package imported

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    await Future.delayed(const Duration(seconds: 3), () {
      if (seenOnboarding) {
        Navigator.pushReplacementNamed(context, "/login"); // Navigate to the login screen
      } else {
        Navigator.pushReplacementNamed(context, "/onboarding"); // Navigate to the onboarding screen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/gradients/19.png',
              fit: BoxFit.cover,
              width: ThemeConstants.backgroundImageWidth,
              height: ThemeConstants.backgroundImageHeight,
            ),
          ),
          // Centered Animated Text
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'WELCOME',
                  textStyle: const TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  speed: const Duration(seconds: 1),
                ),
                FadeAnimatedText(
                  'TO OUR APP',
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  duration: const Duration(seconds: 5),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 800),
              displayFullTextOnTap: true,
            ),
          ),
          // Bottom Linear Progress Indicator
          Positioned(
            bottom: 50.0,
            left: 30.0,
            right: 30.0,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
