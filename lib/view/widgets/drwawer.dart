
import 'package:blood_donation/controller/constants.dart';
import 'package:blood_donation/controller/googleSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../aboutUs.dart';
import '/controller/route.dart' as route;

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
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            arrowColor: Colors.amber,
            accountName: Text("Grama Phone Blood App"),
            accountEmail:isAdmin ? Text('Admin Login') : Text("${user?.email}"),
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
              style: Theme.of(context).textTheme.bodyText1,
            ),
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onPrimary,
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
              style: Theme.of(context).textTheme.bodyText1,
            ),
            leading: Icon(
              Icons.question_answer,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onTap: () {
              _launchInBrowser(
                  "https://wa.me/%2B917561017476?text=hi%20please%20share%20the%20details%20about%20grama%20phone%20blood%20donation%20app");
            },
          ),
          ListTile(
            title: Text(
              'About US',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            leading: Icon(
              Icons.info,
              color: Theme.of(context).colorScheme.onPrimary,
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
              'Language',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            leading: Icon(
              Icons.language,
              color: Theme.of(context).colorScheme.onPrimary,
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
                  isAdmin = false;
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
