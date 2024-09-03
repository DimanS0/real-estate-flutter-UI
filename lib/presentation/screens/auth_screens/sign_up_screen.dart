import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../provider/sign_up_provider.dart';
import '../../widgets/custom_background_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield_widget.dart';




class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundScreen(
      headerImagePath: 'images/background/back6.jpg', // Step 1 background
      showIcons: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                _buildToggleSwitch(context),
                const SizedBox(height: 20.0),
                _buildSignUpForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<LoginSignUpProvider>(context, listen: false).toggleToLogin();
          },
          child: const Text(
            'Log in',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        GestureDetector(
          onTap: () {
            Provider.of<LoginSignUpProvider>(context, listen: false).toggleToSignUp();
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
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
            // Handle Next
          },
        ),
      ],
    );
  }
}

