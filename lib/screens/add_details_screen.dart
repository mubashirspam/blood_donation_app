// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';

class AddDetailsScreen extends StatefulWidget {
  static final routName = '/Add_details_screen';
  @override
  _AddDetailsScreenState createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  Widget BuildTextField(String label) => Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(8),
          //   //   border: Border.all(
          //   //     color: Color(0xffc0c8e4),
          //   //     width: 1,
          //   //   ),
          color: Color(0xfff6f7fa),
        ),
        child: TextFormField(
          
          style: TextStyle(
            color: Color(0xff4058AE),
          ),
          cursorColor: Color(0xff4058AE),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 1,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xffC0C8E4),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xff506EDA),
                width: 2.0,
              ),
            ),
            label: Text(label),
            labelStyle: TextStyle(
              color: Color(0xff7A93EB),
              height: 1,
            ),
          ),
          scrollPadding: EdgeInsets.all(10),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Person',
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            BuildTextField('Name'),
            BuildTextField('Name Malayalam'),
            BuildTextField('Age'),
            BuildTextField('Contact Number'),
          ],
        ),
      ),
    );
  }
}
