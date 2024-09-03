import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true); // Mark as seen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) async {
              if (index == 3) {
                // If last page, wait a bit and navigate to the login screen
                await Future.delayed(Duration(seconds: 1)); // Optional: Add some delay
                _navigateToLogin();
              }
            },
            children: [
              buildPage(
                imagePath: 'images/gradients/13.png',
                text: 'DISCOVER YOUR TYPE OF HOUSE',
              ),
              buildPage(
                imagePath: 'images/gradients/12.png',
                text: 'LEARN TIPS AND GET KNOWLEDGE',
              ),
              buildPage(
                imagePath: 'images/gradients/19.png',
                text: 'GET YOUR OWN HOUSE DESIGN AND PLAN',
              ),
              buildPage(
                imagePath: 'images/gradients/11.png',
                text: 'LETS START OUR JOURNEY',
              ),
            ],
          ),
          Positioned(
            bottom: 30.0,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Colors.grey,
                dotHeight: 8.0,
                dotWidth: 8.0,
                expansionFactor: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({required String imagePath, required String text}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0), // Adjust this value for positioning
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 37.0),
                const Icon(
                  FontAwesomeIcons.circleArrowRight, // Use any icon you prefer
                  color: Colors.white,
                  size: 30.0,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50.0), // Space between the content and the dot indicator
        ],
      ),
    );
  }
}
