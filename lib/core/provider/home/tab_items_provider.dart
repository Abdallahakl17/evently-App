import 'package:flutter/material.dart';

class TabItemsProvider with ChangeNotifier {
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}