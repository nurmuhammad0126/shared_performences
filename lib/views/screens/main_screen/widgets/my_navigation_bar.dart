import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> screenChange;
  final int currentIndex;
  const MyBottomNavigationBar({
    super.key,
    required this.screenChange,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: screenChange,
      selectedFontSize: 20,
      selectedItemColor: Colors.teal,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),

        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
