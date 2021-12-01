// ignore_for_file: deprecated_member_use

import 'dart:ui';


import 'package:blood_donation/screens/home_screen.dart';

import 'package:blood_donation/services/blood_card.dart';
import 'package:blood_donation/services/blood_cards.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddDetailsScreen extends StatefulWidget {
  static final routName = '/Add_details_screen';
  @override
  _AddDetailsScreenState createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
 String? bloodvalue;
 String ? gengervalue;
List <String> blodGroup = ['A +ve','B +ve','O +ve','AB +ve','AB -ve','A -ve','B -ve','O -ve'];
 List <String> gender =['Male','Female','Othor']; 


  var _editBloodCard = BloodCard(
    id: '',
    name: '',
    age: 0,
    bloodGroup: '',
    nameInMalayam: '',
    contact: 0,
    gender: '',
  );
  var _initValue = {
    "name": '',
    'age': '',
    'bloodGroup': '',
    'nameInMalayalam': '',
    'contact': '',
  };
  

  final _formKey = GlobalKey<FormState>();
  Widget BuildTextField(
    String label,
    var initialValue,
    TextInputAction textInputAction,
    TextInputType textInputType,
    FormFieldValidator formFieldValidator,
    FormFieldSetter formFieldSetter,
  ) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(8),
          //   //   border: Border.all(
          //   //     color: Color(0xffc0c8e4),
          //   //     width: 1,
          //   //   ),
          color: Color(0xfff6f7fa),
        ),
        child: TextFormField(
          initialValue: initialValue,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          validator: formFieldValidator,
          onSaved: formFieldSetter,
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
            errorBorder: OutlineInputBorder(
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

          // validator:  (value) {
          //   if (value!.isEmpty) {
          //     return 'Required';
          //   }
          //   return null;
          // },
        ),
      );

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
      // note save input befor validation
    }
    _formKey.currentState!.save();
    
      Provider.of<BloodCards>(context, listen: false)
          .addProduct(_editBloodCard);
      // Navigator.pushReplacementNamed(context, HomeScreen.routName);
    
  }

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
                  BuildTextField('Name', _initValue['name'].toString(),
                      TextInputAction.next, TextInputType.name, (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  }, (value) {
                    _editBloodCard = BloodCard(
                        gender: _editBloodCard.gender,
                        contact: _editBloodCard.contact,
                        id: _editBloodCard.id,
                        name: value.toString(),
                        nameInMalayam: _editBloodCard.nameInMalayam,
                        bloodGroup: _editBloodCard.bloodGroup,
                        age: _editBloodCard.age);
                  }),
                  BuildTextField(
                      'Name Malayalam',
                      _initValue['nameInMalayalam'].toString(),
                      TextInputAction.next,
                      TextInputType.name, (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  }, (value) {
                    _editBloodCard = BloodCard(
                        gender: _editBloodCard.gender,
                        contact: _editBloodCard.contact,
                        id: _editBloodCard.id,
                        name: _editBloodCard.name,
                        nameInMalayam: value.toString(),
                        bloodGroup: _editBloodCard.bloodGroup,
                        age: _editBloodCard.age);
                  }),
                  BuildTextField('Age', _initValue['age'].toString(),
                      TextInputAction.next, TextInputType.number, (value) {
                    if (value!.isEmpty) {
                      return 'Add age ';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Add valid age';
                    }
                    if (int.parse(value) <= 19) {
                      return 'Graterthan 18 ';
                    }
                     if (value.length < 3) {
                      return 'invalid Age';
                    }
                    return null;
                  }, (value) {
                    _editBloodCard = BloodCard(
                        gender: _editBloodCard.gender,
                        contact: _editBloodCard.contact,
                        id: _editBloodCard.id,
                        name: _editBloodCard.name,
                        nameInMalayam: _editBloodCard.nameInMalayam,
                        bloodGroup: _editBloodCard.bloodGroup,
                        age: double.parse(value.toString()));
                  }),
                  BuildTextField(
                      'Contact Number',
                      _initValue['contact'].toString(),
                      TextInputAction.done,
                      TextInputType.number, (value) {
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
                  }, (value) {
                    _editBloodCard = BloodCard(
                        gender: _editBloodCard.gender,
                        contact: int.parse(value),
                        id: _editBloodCard.id,
                        name: _editBloodCard.name,
                        nameInMalayam: _editBloodCard.nameInMalayam,
                        bloodGroup: _editBloodCard.bloodGroup,
                        age: _editBloodCard.age);
                  }),

                  dropDown(context: context, valueb: bloodvalue, myList: blodGroup),
                  dropDown(context: context, valueb: gengervalue, myList: gender)
                  
                ],
              ),
            ),
            TextButton(
              onPressed: _saveForm,
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }






Container dropDown({required BuildContext context , required String? valueb, required List<String> myList}) {
    return Container(
      
      
        width:double.infinity,
        // width: MediaQuery.of(context).size.width * .5,
        margin:EdgeInsets.only(top: 5,bottom: 10) ,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffC0C8E4),),
            borderRadius: BorderRadius.circular(8),
            color: Color(0xfff6f7fa),),
        child: DropdownButtonHideUnderline(
          
          child: DropdownButton<String>(
            
            iconSize: 30,
            items: myList.map(buildmenuItem).toList(),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Color(0xff4058AE),
            ),
            value: valueb == null ? myList[0] : valueb,
            onChanged: (value) => setState(() => valueb = value!),
          ),
        ));
  }

  DropdownMenuItem<String> buildmenuItem(String item) {
    // setState(() {});
    return DropdownMenuItem(
      child: Text(item),
      value: item,
    );
  }

}
