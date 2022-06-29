import 'package:blood_donation/controller/dataProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.read<DataProvider>().isAdmin
              ? Container()
              : Container(
                  margin: EdgeInsets.all(30),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                    image: DecorationImage(
                      image: NetworkImage(currentUser?.photoURL ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Text(
            '${currentUser?.displayName ?? 'No Name'}',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            '${currentUser?.email ?? 'No email'}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    ));
  }
}
