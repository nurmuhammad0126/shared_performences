import 'package:bottom_navigaton_bar/view_model/viewmodel.dart';
import 'package:bottom_navigaton_bar/views/screens/main_screen/screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppService().loadSettings();

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final appService = AppService();
  @override
  Widget build(BuildContext context) {
    final model = appService.model;

    return MaterialApp(
      themeMode: model.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: MainScreen(
      ),
    );
  }
}
