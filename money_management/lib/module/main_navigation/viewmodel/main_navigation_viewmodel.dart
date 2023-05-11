import 'package:flutter/material.dart';
import '../model/main_navigation_model.dart';

class MainNavigationViewModel with ChangeNotifier {
  final MainNavigationModel _mainNavigationModel =
      MainNavigationModel(currentIndex: 0);

  int get currentIndex => _mainNavigationModel.currentIndex;

  void changeTabIndex(int index) {
    _mainNavigationModel.currentIndex = index;
    notifyListeners();
  }
}
