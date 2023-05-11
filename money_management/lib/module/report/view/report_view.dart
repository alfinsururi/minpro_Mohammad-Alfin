import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:money_management/core.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportViewModel>(builder: (context, viewModel, child) {
      Color indicatorColor;
      if (viewModel.diff > 0) {
        indicatorColor = Colors.green;
      } else {
        indicatorColor = Colors.red;
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(viewModel.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "01 ${viewModel.month} - ${viewModel.lastDayOfMonth} ${viewModel.month}",
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Pemasukan",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Text(
                            viewModel.incomeThisMonth.idr,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Pengeluaran",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Text(
                            viewModel.expenseThisMonth.idr,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Selisih",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            viewModel.diff.idr,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: indicatorColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  DB.save("transactions", []);
                  viewModel.notifyListeners();
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Get.to(const InputView());
            viewModel.notifyListeners();
          },
        ),
      );
    });
  }
}
