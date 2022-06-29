import 'package:blood_donation/controller/auth_services.dart';

import 'package:blood_donation/controller/route.dart' as route;
import 'package:blood_donation/controller/utls.dart';
import 'package:blood_donation/view/widgets/form_field.dart';

import 'package:flutter/material.dart';

class AdmminLoginScreen extends StatefulWidget {
  const AdmminLoginScreen({Key? key}) : super(key: key);

  @override
  _AdmminLoginScreenState createState() => _AdmminLoginScreenState();
}

class _AdmminLoginScreenState extends State<AdmminLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // emailController.dispose();
    // passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  login() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    Authentication()
        .signInWithMailId(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      print(emailController.text);
      if (value == 'Signin success') {
        Utils().toast(context, value ?? 'Signin success');
        Navigator.pushReplacementNamed(context, route.homePage);
      } else {
        Utils().toast(context, 'Error in Login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'assets/image/img.png',
                    fit: BoxFit.fitHeight,
                  ),
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
                        BuildTextField(
                          'Username',
                          
                          TextInputAction.next,
                          TextInputType.emailAddress,
                          (value) {
                            if (value!.isEmpty) {
                              return 'Username Required';
                            }
                            return null;
                          },
                          (value) {},
                          false,
                          // emailController,
                          textEditingController: emailController,
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(children: [
                            Expanded(
                              child: BuildTextField(
                                  'Password',
                                
                                  TextInputAction.done,
                                  TextInputType.name, (value) {
                                if (value!.isEmpty) {
                                  return 'Password Required';
                                }
                                return null;
                              }, (value) {}, true,
                                  textEditingController: passwordController),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            onPressed: () {
                              login();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size(double.infinity, 55),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
