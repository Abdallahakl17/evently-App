import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int index = 0;
  void changedIndex(int currentIndex) {
    index = currentIndex;
    notifyListeners();
  }
}
