
import 'package:blood_donation/controller/blood_status_card.dart';
import 'package:blood_donation/view/add_details_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './controller/route.dart' as route;
import 'package:flutter/material.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff506eda), // navigation bar color
    statusBarColor: Color(0xff506eda), // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BloodStatusCards(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BloodDonation',
          theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                animationDuration: Duration(microseconds: 2000),
                overlayColor: MaterialStateProperty.all(
                  Color(0xfff1908c),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Color(0xff506eda),
                ),
              ),
            ),
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
                  headline2: TextStyle(
                    fontSize: 16,
                    color: Color(0xff506eda),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                  headline4: TextStyle(
                    color: Color(0xfff1908c),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
          ),
          // initialRoute: '/',
          routes: {
            AddDetailsScreen.routName: (ctx) => AddDetailsScreen(),
          },

          onGenerateRoute: route.controller,
          initialRoute: route.loginPage,
        ));
  }
}
