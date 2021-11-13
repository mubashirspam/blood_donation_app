import 'package:blood_donation/screens/add_details_screen.dart';

import './screens/tab_screen_dart.dart';

import './screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BloodDonation',
      theme: ThemeData(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Color(0xfff1908c),
          primary: Colors.white,
          onPrimary: Color(0xff506eda),
        ),
        cardColor: Color(0xfff1f5fc),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color(0xff506eda),
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
              bodyText2: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
              headline3: TextStyle(
                fontFamily: 'RobotoCondensed',
                color: Color(0xff506eda),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              headline1: TextStyle(
                fontSize: 24,
                color: Color(0xff506eda),
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              headline5: TextStyle(
                fontSize: 16,
                color: Color(0xffC0C8E4),
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              headline2: TextStyle(
                fontSize: 16,
                color: Color(0xff506eda),
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
              headline4: TextStyle(
                fontSize: 20,
                color: Color(0xfff08f8e),
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
        canvasColor: Color(0xfff1f5fc),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        HomeScreen.routName: (ctx) => HomeScreen(),
        AddDetailsScreen.routName: (ctx) => AddDetailsScreen(),
      },
    );
  }
}
