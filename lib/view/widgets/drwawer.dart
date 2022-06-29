import 'package:blood_donation/controller/auth_services.dart';
import 'package:blood_donation/controller/dataProvider.dart';
import 'package:blood_donation/controller/utls.dart';
import 'package:blood_donation/view/language.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../aboutUs.dart';
import '/controller/route.dart' as route;

class Option extends StatefulWidget {
  const Option({
    Key? key,
  }) : super(key: key);

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  User? user = FirebaseAuth.instance.currentUser;
  bool isAdmin = false;
  bool isSigningOut = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(context.read<DataProvider>().isAdmin);
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.secondary),
              arrowColor: Colors.amber,
              accountName: Text("Grama Phone Blood App"),
              accountEmail: context.read<DataProvider>().isAdmin
                  ? Text('Admin Login')
                  : Text("${user?.email}"),
              currentAccountPicture: context.read<DataProvider>().isAdmin
                  ? Container()
                  : Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage("${user?.photoURL}"),
                            fit: BoxFit.fill,
                          )),
                    )),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.homePage,
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
          context.read<DataProvider>().isAdmin
              ? Container()
              : ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.askDoubt,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  leading: Icon(
                    Icons.question_answer,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onTap: () {
                    Utils().launchInBrowser(
                        "https://wa.me/%2B917561017476?text=hi%20please%20share%20the%20details%20about%20grama%20phone%20blood%20donation%20app");
                  },
                ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.aboutUs,
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
              AppLocalizations.of(context)!.languages,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            leading: Icon(
              Icons.language,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LanguageView()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          context.read<DataProvider>().isAdmin
              ? Container()
              : ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.rateUs,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  leading: Icon(
                    Icons.shop,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: () {
                    Utils().launchInBrowser(
                        "http://play.google.com/store/apps/details?id=com.gramaphone.blood");
                  },
                ),
          ListTile(
              title: Text(
                AppLocalizations.of(context)!.logOut,
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
