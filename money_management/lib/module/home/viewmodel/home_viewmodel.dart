import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../service/main_storage_service/main_storage_service.dart';

class HomeViewModel with ChangeNotifier {
  String get name {
    return DB.get("name");
  }

  String get business {
    return DB.get("business");
  }

  String get today {
    return DateFormat("d MMM y").format(DateTime.now());
  }

  double get incomeToday {
    List transactions = DB.get("transactions") ?? [];
    var list = transactions
        .where((i) =>
            i["type"] == "Income" &&
            DateFormat("dMMMy").format(i["date"]) ==
                DateFormat("dMMMy").format(DateTime.now()))
        .toList();
    var incomeTotal = 0.0;
    for (var item in list) {
      incomeTotal += item["amount"];
    }

    return incomeTotal;
  }

  double get expenseToday {
    List transactions = DB.get("transactions") ?? [];
    var list = transactions
        .where((i) =>
            i["type"] == "Expense" &&
            DateFormat("dMMMy").format(i["date"]) ==
                DateFormat("dMMMy").format(DateTime.now()))
        .toList();
    var expenseTotal = 0.0;
    for (var item in list) {
      expenseTotal += item["amount"];
    }
    return expenseTotal;
  }
}
