
import 'package:blood_donation/services/blood_cards.dart';
import 'package:blood_donation/services/blood_status_card.dart';
import 'package:provider/provider.dart';

import './services/route.dart' as route;
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return 
    
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (ctx)=>BloodCards())
    ,ChangeNotifierProvider(create: (ctx)=>BloodStatusCards(),)],
    child:
     MaterialApp(
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
              ),headline2: TextStyle(
                fontSize: 18
          ,
                color: Color(0xff506eda),
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
        
        ),
        
        // routes: {
        //   '/': (ctx) => TabScreen(),
        //   HomeScreen.routName: (ctx) => HomeScreen(),
        //   AddDetailsScreen.routName: (ctx) => AddDetailsScreen(),
        // },
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (ctx) => TabScreen(),
      //   HomeScreen.routName: (ctx) => HomeScreen(),
      //   AddDetailsScreen.routName: (ctx) => AddDetailsScreen(),
      // },
  
      onGenerateRoute: route.controller,
      initialRoute: route.loginPage,
     ) );
  }
}



