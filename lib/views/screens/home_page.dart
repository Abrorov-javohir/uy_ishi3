import 'package:flutter/material.dart';
import 'package:uy_ishi/views/screens/home_screen.dart';
import 'package:uy_ishi/views/screens/profile_page.dart';
import 'package:uy_ishi/views/screens/static_page.dart';
import 'package:uy_ishi/views/widget/add_task2.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _choiceIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _choiceIndex = index;
    });
  }

  final ContactAddDialog tasksController = ContactAddDialog();

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      Homescreen(),
      Profilepage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _choiceIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _changeIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'Statistic'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: screens[_choiceIndex],
    );
  }
}
