import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management/service/main_storage_service/main_storage_service.dart';

class ReportViewModel with ChangeNotifier {
  String get title {
    String datef = DateFormat("MMM y").format(DateTime.now());
    return "Report - $datef";
  }

  String get lastDayOfMonth {
    var now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0).day.toString();
  }

  String get month {
    String datef = DateFormat("MMM").format(DateTime.now());
    return datef;
  }

  double get incomeThisMonth {
    List transactions = DB.get("transactions") ?? [];
    var list = transactions.where((i) => i["type"] == "Income").toList();
    var incomeTotal = 0.0;
    for (var item in list) {
      incomeTotal += item["amount"];
    }

    return incomeTotal;
  }

  double get expenseThisMonth {
    List transactions = DB.get("transactions") ?? [];
    var list = transactions
        .where((i) =>
            i["type"] == "Expense" &&
            DateFormat("MMMy").format(i["date"]) ==
                DateFormat("MMMy").format(DateTime.now()))
        .toList();
    var expenseTotal = 0.0;
    for (var item in list) {
      expenseTotal += item["amount"];
    }
    return expenseTotal;
  }

  double get incomeLifetime {
    List transactions = DB.get("transactions") ?? [];
    var list = transactions
        .where((i) =>
            i["type"] == "Income" &&
            DateFormat("MMMy").format(i["date"]) ==
                DateFormat("MMMy").format(DateTime.now()))
        .toList();
    var incomeTotal = 0.0;
    for (var item in list) {
      incomeTotal += item["amount"];
    }

    return incomeTotal;
  }

  double get expenseLifetime {
    List transactions = DB.get("transactions") ?? [];
    var list = transactions.where((i) => i["type"] == "Expense").toList();
    var expenseTotal = 0.0;
    for (var item in list) {
      expenseTotal += item["amount"];
    }
    return expenseTotal;
  }

  double get diff {
    return incomeThisMonth - expenseThisMonth;
  }

  List get transactions {
    return DB.get("transactions") ?? [];
  }
}
