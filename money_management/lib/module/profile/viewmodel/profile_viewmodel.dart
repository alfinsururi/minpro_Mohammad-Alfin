import 'package:flutter/material.dart';
import '../../welcome/view/welcome_view.dart';
import '../model/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileModel? profile;

  void logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => WelcomeView()),
      (Route<dynamic> route) => false,
    );
  }
}
