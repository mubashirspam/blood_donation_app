import 'package:blood_donation/services/constants.dart';
import 'package:blood_donation/services/googleSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/services/route.dart' as route;

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
        color: Colors.white,
        child: Center(
          child: FutureBuilder(
            future: Authentication.initializeFirebase(context: context),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return LoginUi();
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  CustomColors.firebaseOrange,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  bool _isSigningIn = false;
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
                // Navigator.of(context).pushNamed(route.homePage);
                Navigator.of(context).pushNamed(route.adminLoginPage);
              },
              child: Text(
                'Admin',
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 55),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                  isAdmin == false;
                });

                User? user =
                    await Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {
                  bool isAdmin = true;
                  Navigator.of(context)
                      .pushNamed(route.homePage, arguments: isAdmin);
                }

                setState(() {
                  _isSigningIn = false;
                });
              },
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
