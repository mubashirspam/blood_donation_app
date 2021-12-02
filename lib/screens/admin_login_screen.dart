import 'package:blood_donation/services/route.dart' as route;
import 'package:blood_donation/widgets/form_field.dart';
import 'package:flutter/material.dart';

class AdmminLoginScreen extends StatefulWidget {
  const AdmminLoginScreen({Key? key}) : super(key: key);

  @override
  _AdmminLoginScreenState createState() => _AdmminLoginScreenState();
}

class _AdmminLoginScreenState extends State<AdmminLoginScreen> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 30),
                
                child: Image.asset('assets/image/img.png',fit: BoxFit.fitHeight,),
              ),
              Text(
                'Admin Login',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      BuildTextField('Gmail', '', TextInputAction.next,
                          TextInputType.emailAddress, (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      }, (_) {}, false,),
                      Container(
                        width: double.infinity,
                        child: Row(children: [
                          Expanded(
                            child: BuildTextField(
                                'Password',
                                '',
                                TextInputAction.done,
                                TextInputType.name, (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            }, (_) {}, _visible, ),
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       _visible = !_visible;
                                
                          //     });
                          //   },
                          //   icon: Icon( _visible?  Icons.visibility_off_outlined :Icons.visibility_outlined),
                          // )
                        ]),
                      ),

                      Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: (){

                   Navigator.of(context).pushReplacementNamed(route.homePage);
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
                style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
