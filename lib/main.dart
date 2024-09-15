import 'package:flutter/material.dart';
import 'assessmentpage.dart';
import 'chatpage.dart';
import 'coursepage.dart';
import 'homepage.dart';
import 'profilepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PixelifySans', // Global font
      ),
      home: MainPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/assessment1': (context) => AssessmentPage1(),
        '/courses': (context) => CoursesPage(),
        '/chats': (context) => ChatPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/assessment1');
        break;
      case 2:
        Navigator.pushNamed(context, '/courses');
        break;
      case 3:
        Navigator.pushNamed(context, '/chats');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          AssessmentPage1(),
          CoursesPage(),
          ChatPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
