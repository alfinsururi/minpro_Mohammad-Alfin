import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_management/core.dart';

class InputView extends StatelessWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<InputViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    AbsorbPointer(
                      child: QDatePicker(
                        label: "Tanggal",
                        validator: Validator.required,
                        value: DateTime.now(),
                        onChanged: (value) {
                          print("value: $value");
                        },
                      ),
                    ),
                    const Divider(),
                    QNumberField(
                      label: "Jumlah",
                      validator: Validator.required,
                      value: "24",
                      onChanged: (value) {
                        viewModel.amount = double.tryParse(value) ?? 0;
                      },
                    ),
                    QDropdownField(
                      label: "Type",
                      validator: Validator.required,
                      items: const [
                        {
                          "label": "Income",
                          "value": "Income",
                        },
                        {
                          "label": "Expense",
                          "value": "Expense",
                        }
                      ],
                      value: "Income",
                      onChanged: (value, label) {
                        viewModel.type = label!;
                      },
                    ),
                    const Divider(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 38,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () => viewModel.save(),
                        child: const Text("Simpan"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
