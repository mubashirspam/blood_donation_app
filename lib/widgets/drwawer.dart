import 'package:blood_donation/screens/aboutUs.dart';
import 'package:blood_donation/services/googleSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/services/route.dart' as route;

class Option extends StatefulWidget {
  // final User user;
  const Option({
    Key? key,
  }) : super(key: key);

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  User? user = FirebaseAuth.instance.currentUser;
  // late User user;
  bool isSigningOut = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Grama Phone Blood App"),
            accountEmail: Text("${user?.email}"),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("${user?.photoURL}"),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          ListTile(
            title: Text(
              'Home Page',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, route.homePage);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            title: Text(
              'Ask A Doubt',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.question_answer,
              color: Colors.black,
            ),
            onTap: () {
              _launchInBrowser(
                  "https://wa.me/%2B917561017476?text=hi%20please%20share%20the%20details%20about%20grama%20phone%20blood%20donation%20app");
            },
          ),
          ListTile(
            title: Text(
              'About US',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.info,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              'Rate Us',
              style: Theme.of(context).textTheme.headline4,
            ),
            leading: Icon(
              Icons.shop,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {
              _launchInBrowser('https://play.google.com/store/apps/details');
            },
          ),
          ListTile(
              title: Text(
                'Log out',
                style: Theme.of(context).textTheme.headline4,
              ),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onTap: () async {
                setState(() {
                  isSigningOut = true;
                });
                await Authentication.signOut(context: context);
                setState(() {
                  isSigningOut = false;
                });
                Navigator.of(context).pushReplacementNamed(route.loginPage);
              }),
        ],
      ),
    );
  }
}

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'header_key': 'header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}
