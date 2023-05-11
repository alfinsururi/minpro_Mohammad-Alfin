import 'package:flutter/material.dart';
import 'package:money_management/service/main_storage_service/main_storage_service.dart';

import '../model/welcome_model.dart';

class WelcomeViewModel with ChangeNotifier {
  final WelcomeModel _welcomeModel = WelcomeModel();

  String get name => _welcomeModel.name;

  void setName(String name) {
    _welcomeModel.name = name;
    DB.save("name", name);
  }

  String get business => _welcomeModel.business;

  void setBusiness(String business) {
    _welcomeModel.business = business;
    DB.save("business", business);
  }
}
