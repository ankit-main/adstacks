import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int selectedMenu = 0;

  bool adstacksExpanded = true;
  bool financeExpanded = false;

  void selectMenu(int index) {
    selectedMenu = index;
    notifyListeners();
  }

  void toggleAdstacks() {
    adstacksExpanded = !adstacksExpanded;
    notifyListeners();
  }

  void toggleFinance() {
    financeExpanded = !financeExpanded;
    notifyListeners();
  }
}