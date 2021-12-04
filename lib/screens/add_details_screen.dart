// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:blood_donation/services/blood_status_card.dart';
import 'package:blood_donation/widgets/form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddDetailsScreen extends StatefulWidget {
  static final routName = '/Add_details_screen';
  @override
  _AddDetailsScreenState createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? bloodvalue;
  String? gengervalue;
  List<String> blodGroup = [
    'A +ve',
    'B +ve',
    'O +ve',
    'AB +ve',
    'AB -ve',
    'A -ve',
    'B -ve',
    'O -ve'
  ];
  List<String> gender = ['Male', 'Female', 'Othor'];
  final myController = TextEditingController(text: "Your initial value");

  var _editBloodCard = StatusCard(
    id: '',
    name: '',
    age: 0,
    bloodGrupe: '',
    nameInMalayam: '',
    contact: 0,
    gender: '',
  );
  var _initValue = {
    "name": '',
    'age': '',
    'nameInMalayalam': '',
    'contact': '',
  };

  var _isInit = true;
  @override
  void didChangeDependencies() {
    // for edit product

    if (_isInit) {
      final cardId = ModalRoute.of(context)!.settings.arguments as String;
      if (cardId != 'new') {
        _editBloodCard = Provider.of<BloodStatusCards>(context, listen: false)
            .findById(cardId);
        _initValue = {
           "name": _editBloodCard.name,
          'age': _editBloodCard.age.toStringAsFixed(0),
          'nameInMalayalam': _editBloodCard.nameInMalayam,
          'contact': _editBloodCard.contact.toStringAsFixed(0),
        };
      } 
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
      // note save input befor validation
    }
    _formKey.currentState!.save();

    if (_editBloodCard.id != '') {
      Provider.of<BloodStatusCards>(context, listen: false)
          .updateCard(_editBloodCard.id, _editBloodCard);
    } else {
      Provider.of<BloodStatusCards>(context, listen: false)
          .addCard(_editBloodCard);
    }

    // _formKey.currentState!.reset();
    Navigator.of(context).pop();

    // Navigator.pushReplacementNamed(context, HomeScreen.routName);
  }
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  BuildTextField(
                    'Name', _initValue['name'].toString(),
                    TextInputAction.next,
                    TextInputType.name,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    (value) {
                      _editBloodCard = StatusCard(
                          gender: _editBloodCard.gender,
                          contact: _editBloodCard.contact,
                          id: _editBloodCard.id,
                          name: value.toString(),
                          nameInMalayam: _editBloodCard.nameInMalayam,
                          bloodGrupe: _editBloodCard.bloodGrupe,
                          age: _editBloodCard.age);
                    },
                    false,
                    // myController,
                  ),
                  BuildTextField(
                    'Name Malayalam',
                    _initValue['nameInMalayalam'].toString(),
                    TextInputAction.next,
                    TextInputType.name,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    (value) {
                      _editBloodCard = StatusCard(
                          gender: _editBloodCard.gender,
                          contact: _editBloodCard.contact,
                          id: _editBloodCard.id,
                          name: _editBloodCard.name,
                          nameInMalayam: value.toString(),
                          bloodGrupe: _editBloodCard.bloodGrupe,
                          age: _editBloodCard.age);
                    },
                    false,
                    // myController,
                  ),
                  BuildTextField(
                    'Age', _initValue['age'].toString(),
                    TextInputAction.next,
                    TextInputType.number,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Add age ';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Add valid age';
                      }
                      if (double.parse(value) <= 19) {
                        return 'Graterthan 18 ';
                      }
                      //  if (value.length < 3) {
                      //   return 'invalid Age';
                      // }
                      return null;
                    },
                    (value) {
                      _editBloodCard = StatusCard(
                          gender: _editBloodCard.gender,
                          contact: _editBloodCard.contact,
                          id: _editBloodCard.id,
                          name: _editBloodCard.name,
                          nameInMalayam: _editBloodCard.nameInMalayam,
                          bloodGrupe: _editBloodCard.bloodGrupe,
                          age: double.parse(value.toString()));
                    },
                    false,
                    // myController,
                  ),
                  BuildTextField(
                    'Contact Number',
                    _initValue['contact'].toString(),
                    TextInputAction.done,
                    TextInputType.number,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Add contact number ';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Add valid number';
                      }
                      if (value.length < 10) {
                        return 'invalid mobile number';
                      }
                      if (value.length > 10) {
                        return 'invalid mobile number';
                      }
                      return null;
                    },
                    (value) {
                      _editBloodCard = StatusCard(
                          gender: _editBloodCard.gender,
                          contact: double.parse(value),
                          id: _editBloodCard.id,
                          name: _editBloodCard.name,
                          nameInMalayam: _editBloodCard.nameInMalayam,
                          bloodGrupe: _editBloodCard.bloodGrupe,
                          age: _editBloodCard.age);
                    },
                    false,
                    // myController,
                  ),
                  dropDown(
                      context: context, valueb: bloodvalue, myList: blodGroup),
                  dropDown(
                      context: context, valueb: gengervalue, myList: gender)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: _saveForm,
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
                style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dropDown(
      {required BuildContext context,
      required String? valueb,
      required List<String> myList}) {
    return Container(
        width: double.infinity,
        // width: MediaQuery.of(context).size.width * .5,
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffC0C8E4),
          ),
          borderRadius: BorderRadius.circular(8),
          color: Color(0xfff6f7fa),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconSize: 30,
            items: myList.map(buildmenuItem).toList(),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Color(0xff4058AE),
            ),
            value: valueb == null ? myList[0] : valueb,
            onChanged: (String? value) => setState(() {
              valueb = value!;
            }),
          ),
        ));
  }

  DropdownMenuItem<String> buildmenuItem(String item) {
    // setState(() {});
    return DropdownMenuItem(
      child: Text(
        item,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: item,
    );
  }
}
