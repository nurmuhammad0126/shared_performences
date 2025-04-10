import 'package:bottom_navigaton_bar/views/screens/home_screen/widgets/fact_wdget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<String> lst = [
    "Mushuklar 100 dan ortiq turli tovushlar chiqarishi mumkin.",
    "Delfinlar o'zlarini oynada taniy oladi.",
    "Chivinlar odamlar terisidan chiqayotgan karbonat angidridga tortiladi.",
    "Baliqchilik — insoniyatdagi eng qadimiy kasblardan biri hisoblanadi.",
    "Arilar o'zaro raqs orqali aloqa qilishadi.",
    "Suv ostidagi eng baland tog' - Tinch okeanidagi Mauna Kea vulqoni.",
    "Odam yuragi bir kunda taxminan 100,000 marta uradi.",
    "Eng katta hayvon - ko'k kit, u 30 metrga yetadi.",
    "Piyoz to'g'rayotganda ko'z yoshlanishi fermentlar sababli bo'ladi.",
    "Kengurular orqaga yurisholmaydi.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home Screen",
          style: TextStyle(
            fontSize: 22,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return FactWidget(title: lst[index]);
        },
        itemCount: lst.length,
      ),
    );
  }
}
