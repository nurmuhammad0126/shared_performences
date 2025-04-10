import 'package:bottom_navigaton_bar/view_model/viewmodel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  Function reFresh;
  SettingsScreen({super.key,required this.reFresh});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final appService = AppService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile Screen",
          style: TextStyle(
            fontSize: 22,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          ListTile(
            leading: Icon(Icons.dark_mode, color: Colors.blue),
            title: Text(
              "Dark Mode",
              style: TextStyle(
                fontSize: 22,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),

            trailing: Switch(
              value: appService.model.darkMode,
              onChanged: (value) {
                appService.toggleDarkMode();
                setState(() {
                  widget.reFresh();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
