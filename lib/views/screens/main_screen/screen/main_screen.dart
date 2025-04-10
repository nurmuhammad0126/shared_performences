import 'package:bottom_navigaton_bar/view_model/viewmodel.dart';
import 'package:bottom_navigaton_bar/views/screens/home_screen/screen/home_screen.dart';
import 'package:bottom_navigaton_bar/views/screens/main_screen/widgets/my_navigation_bar.dart';
import 'package:bottom_navigaton_bar/views/screens/profile_screen/screen/profile_screen.dart';
import 'package:bottom_navigaton_bar/views/screens/settings_screen/screen/settings_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  Function reFresh;
  MainScreen({super.key, required this.reFresh});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [];
  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(),
      ProfileScreen(reFresh: widget.reFresh),
      SettingsScreen(reFresh: widget.reFresh),
    ];
  }

  final appService = AppService();

  @override
  Widget build(BuildContext context) {
    final model = AppService().model;
    return Scaffold(
      body: IndexedStack(index: model.indexScreen, children: screens),
      bottomNavigationBar: MyBottomNavigationBar(
        screenChange: (value) {
          appService.updateIndex(value);
          setState(() {});
        },
        currentIndex: model.indexScreen,
      ),
    );
  }
}
