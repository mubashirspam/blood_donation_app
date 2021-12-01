import 'package:blood_donation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BLOOD ',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'DONATION',
                  style: TextStyle(
                      color: Color(0xffFCC0BD),
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'വടവുകോട്‌ പുത്തെൻകുരിശ് ഗ്രാമപഞ്ചായത്തിലെ ഒന്നാം വാർഡിലെ ജനങ്ങൾ ആരംഭിച്ച ഗ്രാമഫോൺ കൂട്ടായ്മയുടെ രക്തദാന സേനയുടെ മൊബൈൽ ആപ്ലിക്കേഷൻ ആണ് ഇത്',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.routName);
              },
              child: Text(
                'Admin',
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Log in with Google',
                style: Theme.of(context).textTheme.headline2,
              ),
              style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Color(0xffF6F7FA)),
            ),
          ],
        ),
      ),
    );
  }
}
