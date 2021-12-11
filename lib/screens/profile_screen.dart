import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(child: Text("Image")),
              margin: EdgeInsets.all(30),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            ),
            Text(
              'Name',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Gmaile.com',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    ));
  }
}
