import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_background_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield_widget.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true; // State to track whether to show login or sign-up
  int signUpStep = 1; // Track the current step in the Sign-Up process

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundScreen(
      headerImagePath: isLogin
          ? 'images/background/back5.webp'
          : _getBackgroundImage(), // Change background based on step
      showIcons: isLogin, // Show icons only for the login screen
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleSwitch(),
          const SizedBox(height: 20.0),
          isLogin ? _buildLoginForm() : _buildSignUpForm(), // Conditionally show login or sign-up form
        ],
      ),
    );
  }

  String _getBackgroundImage() {
    switch (signUpStep) {
      case 2:
        return 'images/background/back3.jpeg'; // Background for step 2
      case 3:
        return 'images/background/back4.jpg'; // Background for step 3
      default:
        return 'images/background/back6.jpg'; // Default background for step 1
    }
  }

  Widget _buildToggleSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isLogin = true;
              signUpStep = 1; // Reset step to 1 if switching to login
            });
          },
          child: Text(
            'Log in',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18.0,
              fontWeight: isLogin ? FontWeight.bold : FontWeight.normal,
              color: isLogin ? Colors.black : Colors.grey,
            ),
          ),
        ),
        const SizedBox(width: 150.0),
        GestureDetector(
          onTap: () {
            setState(() {
              isLogin = false;
            });
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18.0,
              fontWeight: !isLogin ? FontWeight.bold : FontWeight.normal,
              color: !isLogin ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          hintText: 'E-Mail',
          icon: CupertinoIcons.mail,
          controller: TextEditingController(),
        ),
        const SizedBox(height: 20.0),
        CustomTextField(
          hintText: 'Password',
          icon: CupertinoIcons.lock,
          isPasswordField: true,
          controller: TextEditingController(),
        ),
        const SizedBox(height: 20.0),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              // Handle Forgot Password
            },
            child: const Text(
              'Forgot your Password?',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.blueAccent,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Log in',
          onPressed: () {
             Navigator.pushNamed(context, '/home');
          },
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    switch (signUpStep) {
      case 1:
        return _buildStep1Form();
      case 2:
        return _buildStep2Form();
      case 3:
        return _buildStep3Form();
      default:
        return _buildStep1Form();
    }
  }

  Widget _buildStep1Form() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          hintText: 'First Name',
          icon: CupertinoIcons.person,
          controller: TextEditingController(),
        ),
        const SizedBox(height: 20.0),
        CustomTextField(
          hintText: 'Last Name',
          icon: CupertinoIcons.person,
          controller: TextEditingController(),
        ),
        const SizedBox(height: 20.0),
        CustomTextField(
          hintText: 'E-Mail',
          icon: CupertinoIcons.mail,
          controller: TextEditingController(),
        ),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Next',
          onPressed: () {
            setState(() {
              signUpStep = 2; // Move to step 2
            });
          },
        ),
      ],
    );
  }

  Widget _buildStep2Form() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Confirm your mail',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            return SizedBox(
              width: 40.0,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Next',
          onPressed: () {
            setState(() {
              signUpStep = 3; // Move to step 3
            });
          },
        ),
      ],
    );
  }

  Widget _buildStep3Form() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          hintText: 'Create Password',
          icon: CupertinoIcons.lock,
          isPasswordField: true,
          controller: TextEditingController(),
        ),
        const SizedBox(height: 20.0),
        CustomTextField(
          hintText: 'Confirm Password',
          icon: CupertinoIcons.lock,
          isPasswordField: true,
          controller: TextEditingController(),
        ),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Sign Up',
          onPressed: () {
            // Handle Complete Sign-Up
          },
        ),
      ],
    );
  }
}
