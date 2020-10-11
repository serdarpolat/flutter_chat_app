import 'package:flutter/material.dart';

class TabMenuState with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class BottomMenuState with ChangeNotifier {
  int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;

  changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
