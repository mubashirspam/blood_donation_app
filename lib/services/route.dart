import 'package:blood_donation/screens/add_details_screen.dart';
import 'package:blood_donation/screens/admin_login_screen.dart';
import 'package:blood_donation/screens/login_screen.dart';
import 'package:blood_donation/screens/tab_screen_dart.dart';
import 'package:flutter/material.dart';

const String loginPage = 'login';
const String homePage = 'home';
const String adminLoginPage = 'adminLogin';
const String adDetailsScreen = 'adDetailsScreen';

Route<dynamic> controller(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case adminLoginPage:
      return MaterialPageRoute(builder: (context) => AdmminLoginScreen());
    case adDetailsScreen:
      return MaterialPageRoute(builder: (context) => AddDetailsScreen());
    case homePage:
      return MaterialPageRoute(
          builder: (context) => TabScreen(
                isAdmin: arguments,
              ));

    default:
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}
