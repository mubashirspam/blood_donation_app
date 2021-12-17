import 'package:blood_donation/screens/add_details_screen.dart';
import 'package:flutter/material.dart';


class ApplayScreen extends StatelessWidget {
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Applay New Form",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "Description  is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,  ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextButton(

              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AddDetailsScreen.routName, arguments: 'new');
              },
              child: Text(
                'Applay New',
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  // backgroundColor: Theme.of(context).colorScheme.onPrimary,
                elevation: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
