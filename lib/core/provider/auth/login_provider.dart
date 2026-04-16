import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }
}
