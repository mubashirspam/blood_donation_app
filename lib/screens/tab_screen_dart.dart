import 'package:blood_donation/screens/add_details_screen.dart';
import 'package:blood_donation/screens/home_screen.dart';
import 'package:blood_donation/screens/profile_screen.dart';
import 'package:blood_donation/screens/settings_screen.dart';
import 'package:blood_donation/screens/status_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

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
      'page': AddDetailsScreen(),
      'title': 'Add Person',
    },
    {
      'page': StatusScreen(),
      'title': 'Application Status',
    },
    {
      'page': SettingsScreen(),
      'title': 'Settings',
    },
    {
      'page': ProfileScreen(),
      'title': 'My Profile',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
              Icons.list_alt_outlined,
            ),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_accessibility_outlined,
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.verified_user_outlined,
            ),
            label: 'Me',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
