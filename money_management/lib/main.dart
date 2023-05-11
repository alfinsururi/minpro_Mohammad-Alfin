import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:money_management/core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }
  mainStorage = await Hive.openBox('mainStorage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainNavigationViewModel>(
          create: (_) => MainNavigationViewModel(),
        ),
        ChangeNotifierProvider<WelcomeViewModel>(
          create: (_) => WelcomeViewModel(),
        ),
        ChangeNotifierProvider<ProfileViewModel>(
          create: (_) => ProfileViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider<ReportViewModel>(
          create: (_) => ReportViewModel(),
        ),
        ChangeNotifierProvider<InputViewModel>(
          create: (_) => InputViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Project',
        navigatorKey: Get.navigatorKey,
        theme: defaultTheme,
        home: WelcomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
