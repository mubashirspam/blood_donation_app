import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white60,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
              ),
              Text('For more information Contact',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18),),
              Divider(
                color: Colors.transparent,
              ),
              Text('anasmm@gmail.com',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 25),),
              Divider(
                color: Colors.transparent,
              ),
              Text('App Version: 1.00021',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),

        ),
      ),
    );
  }
}
