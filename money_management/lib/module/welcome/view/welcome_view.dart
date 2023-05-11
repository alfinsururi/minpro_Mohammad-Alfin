import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_management/core.dart';

class WelcomeView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://icons.iconarchive.com/icons/atyourservice/service-categories/256/Accounting-Calculator-icon.png",
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 32.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: DB.get("name"),
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan nama';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        Provider.of<WelcomeViewModel>(context, listen: false)
                            .setName(value);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: DB.get("business"),
                      decoration: const InputDecoration(
                        labelText: 'Bisnis',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan tipe bisnis';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        Provider.of<WelcomeViewModel>(context, listen: false)
                            .setBusiness(value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => MainNavigationViewModel(),
                          child: MainNavigationView(),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Mulai'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
