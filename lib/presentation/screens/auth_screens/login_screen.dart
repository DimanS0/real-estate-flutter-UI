// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../provider/sign_up_provider.dart';
// import '../../widgets/custom_background_widget.dart';
// import '../../widgets/custom_button.dart';
// import '../../widgets/custom_textfield_widget.dart';
// import 'sign_up_screen.dart';
//
//
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomBackgroundScreen(
//       headerImagePath: 'images/background/back5.webp',
//       showIcons: true,
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 10.0),
//             child: Column(
//               children: [
//                 _buildToggleSwitch(context),
//                 const SizedBox(height: 20.0),
//                 _buildLoginForm(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildToggleSwitch(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () {
//             Provider.of<LoginSignUpProvider>(context, listen: false).toggleToLogin();
//           },
//           child: const Text(
//             'Log in',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         const SizedBox(width: 20.0),
//         GestureDetector(
//           onTap: () {
//             Provider.of<LoginSignUpProvider>(context, listen: false).toggleToSignUp();
//           },
//           child: const Text(
//             'Sign Up',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontSize: 18.0,
//               fontWeight: FontWeight.normal,
//               color: Colors.grey,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLoginForm() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CustomTextField(
//           hintText: 'E-Mail',
//           icon: CupertinoIcons.mail,
//           controller: TextEditingController(),
//         ),
//         const SizedBox(height: 20.0),
//         CustomTextField(
//           hintText: 'Password',
//           icon: CupertinoIcons.lock,
//           isPasswordField: true,
//           controller: TextEditingController(),
//         ),
//         const SizedBox(height: 20.0),
//         Align(
//           alignment: Alignment.center,
//           child: TextButton(
//             onPressed: () {
//               // Handle Forgot Password
//             },
//             child: const Text(
//               'Forgot your Password?',
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 color: Colors.blueAccent,
//                 fontSize: 14.0,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20.0),
//         CustomButton(
//           text: 'Log in',
//           onPressed: () {
//             // Handle Log in
//           },
//         ),
//       ],
//     );
//   }
// }
//
