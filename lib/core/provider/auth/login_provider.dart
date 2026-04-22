import 'package:flutter/material.dart';

 
import 'package:enently/core/model/user_model.dart';
import 'package:enently/core/services/firebase_sevices/store_service.dart';

class UserProvider extends ChangeNotifier {

  UserModel? currentUser;
  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }

  Future<void> loadUser() async {
    await StoreService.loadCurrentUser();
    currentUser = UserModel.currentUser;
    notifyListeners();
  }

  void setUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }
}