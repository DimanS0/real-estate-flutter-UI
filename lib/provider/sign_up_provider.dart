import 'package:flutter/material.dart';

class LoginSignUpProvider extends ChangeNotifier {
  bool _isLogin = true;

  bool get isLogin => _isLogin;

  void toggleToLogin() {
    if (!_isLogin) {
      _isLogin = true;
      notifyListeners(); // This should trigger a UI update
    }
  }

  void toggleToSignUp() {
    if (_isLogin) {
      _isLogin = false;
      notifyListeners(); // This should trigger a UI update
    }
  }
}
