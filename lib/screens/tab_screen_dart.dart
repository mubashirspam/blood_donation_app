import 'package:blood_donation/screens/applay_screen.dart';
import 'package:blood_donation/screens/home_screen.dart';

import 'package:blood_donation/screens/profile_screen.dart';
import 'package:blood_donation/screens/status_screen.dart';

import 'package:blood_donation/widgets/drwawer.dart';

import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {

   TabScreen({Key? key }) : super(key: key );

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': HomeScreen(),
      'title': 'HomeScreen',
    },
    {
      'page': ApplayScreen(),
      'title': 'Applay New',
    },

    {
      'page': StatusScreen(),
      'title': 'Application Status',
    },
    {
      'page': ProfileScreen(),
      'title': 'My Profile',
    },
  ];
  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      drawer: Option(),
      body: _pages[_selectedIndex]['page'] as Widget,
      appBar: AppBar(
        // leading: Icon(Icons.menu_outlined),
        title: Text(_pages[_selectedIndex]['title'] as String),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            
            icon: Icon(
              Icons.add_chart,
            ),
            label: 'Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_outlined,
            ),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
