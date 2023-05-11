import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_management/core.dart';

class MainNavigationView extends StatelessWidget {
  final List<Widget> _pages = [
    const HomeView(),
    const ReportView(),
    const ProfileView(),
  ];

  MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainNavigationViewModel>(
        builder: (context, viewModel, child) => _pages[viewModel.currentIndex],
      ),
      bottomNavigationBar: Consumer<MainNavigationViewModel>(
        builder: (context, viewModel, child) => BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: (index) {
            Provider.of<MainNavigationViewModel>(context, listen: false)
                .changeTabIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.line_axis),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
