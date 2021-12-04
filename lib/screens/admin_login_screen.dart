import 'package:blood_donation/services/route.dart' as route;
import 'package:blood_donation/widgets/form_field.dart';
import 'package:flutter/material.dart';

class Login {
  final String maile;
  final String password;

  Login({required this.maile, required this.password});
}

class AdmminLoginScreen extends StatefulWidget {
  const AdmminLoginScreen({Key? key}) : super(key: key);

  @override
  _AdmminLoginScreenState createState() => _AdmminLoginScreenState();
}

class _AdmminLoginScreenState extends State<AdmminLoginScreen> {
  // final emailController = TextEditingController(text: "Your initial value");
  // final passwordController = TextEditingController(text: "Your initial value");

  var _login = Login(
    maile: '',
    password: '',
  );
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool _visible = true;
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }
  final _formKey = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
      // note save input befor validation
    }
    _formKey.currentState!.save();
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
                          '',
                          TextInputAction.next,
                          TextInputType.emailAddress,
                          (value) {
                            if (value!.isEmpty) {
                              return 'Username Required';
                            }
                            return null;
                          },
                          (value) {
                            _login = Login(
                                maile: value.toString(),
                                password: _login.password);
                          },
                          false,
                          // emailController,
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(children: [
                            Expanded(
                              child: BuildTextField(
                                'Password',
                                '',
                                TextInputAction.done,
                                TextInputType.name,
                                (value) {
                                  if (value!.isEmpty) {
                                    return 'Password Required';
                                  }
                                  return null;
                                },
                                (value) {
                                  _login = Login(
                                      maile: _login.maile,
                                      password: value.toString());
                                },
                                _visible,
                                // passwordController,
                              ),
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
                            onPressed: () {
                              _saveForm();
                              if (_login.maile == "mub" &&
                                  _login.password == 'mub') {
                                Navigator.of(context)
                                    .pushReplacementNamed(route.homePage);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Incorrect user name or Passw0rd',
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }
                              ;
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
