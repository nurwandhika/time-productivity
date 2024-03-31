import 'dart:async';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/pomodoro_screen.dart';
import 'package:pomodoro_app/screens/todo_screen.dart';

class Home extends StatefulWidget {
  final List<Icon> timesCompleted = [];
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;

  List<Widget> screen = [ToDo(), Pomodoro()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return screen[_currentIndex];
        },
      ),
      extendBody: true,
        // backgroundColor: Colors.pink,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: DotNavigationBar(
          margin: EdgeInsets.only(left: 10, right: 10),
          currentIndex: _currentIndex,
          // backgroundColor: Colors.pink,
          backgroundColor: Colors.black,
          unselectedItemColor: Color(0xffA9ACA9),
          enableFloatingNavBar: false,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.dashboard_customize_rounded),
              selectedColor: Colors.white,
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Color(0xffA9ACA9),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded),
              selectedColor: Color(0xffA9ACA9),
            ),
          ],
        ),
      ),
    );
  }
}
