import 'package:flutter/material.dart';
import 'package:money_management/core.dart';

class InputViewModel with ChangeNotifier {
  double amount = 0;
  String type = "Income";
  save() async {
    List transactions = DB.get("transactions") ?? [];
    transactions.add({
      "date": DateTime.now(),
      "type": type,
      "amount": amount,
    });
    DB.save("transactions", transactions);
    Get.back();
  }
}
