


import 'package:blood_donation/screens/home_screen.dart';
import 'package:blood_donation/screens/login_screen.dart';
import 'package:blood_donation/screens/tab_screen_dart.dart';
import 'package:flutter/material.dart';

const String loginPage = 'login';
const String homePage = 'home';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case homePage:
      return MaterialPageRoute(builder: (context) => TabScreen());
    default:
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }

}