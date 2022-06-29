import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String? version;

  Future<String> getVersionName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }


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
              Text(
                'For more information Contact',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Divider(
                color: Colors.transparent,
              ),
              Text(
                'anasmm99@gmail.com',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Divider(
                color: Colors.transparent,
              ),
              FutureBuilder(
                future: getVersionName()
                ,
                builder: (context, snapshot) {
                  return Text(
                    'App Version: ${snapshot.data}',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
