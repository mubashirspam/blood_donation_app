// ignore_for_file: deprecated_member_use

import 'package:blood_donation/controller/constants.dart';
import 'package:blood_donation/controller/dataProvider.dart';
import 'package:blood_donation/controller/utls.dart';

import 'package:blood_donation/model/blood_model.dart';
import 'package:blood_donation/view/widgets/form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uuid/uuid.dart';

class AddDetailsScreen extends StatefulWidget {
  final BloodModel? bloodModel;
  static final routName = '/Add_details_screen';
  AddDetailsScreen({Key? key, this.bloodModel}) : super(key: key);

  @override
  _AddDetailsScreenState createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameInMalayalamController = TextEditingController();
  String? bloodvalue;
  String? gengervalue;
  var uid = Uuid();
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

  Future<void> _saveForm() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    bool _isValid = _formKey.currentState!.validate();

    if (!_isValid) {
      return;
    }
    BloodModel _bloodModel = BloodModel(
        gender: gengervalue ?? gender[0],
        age: double.parse(ageController.text),
        bloodGrupe: bloodvalue ?? blodGroup[0],
        collectionId: uid.v1(),
        userId: currentUser?.uid ?? '',
        name: nameController.text,
        contact: int.parse(phoneController.text),
        nameInMalayam: nameInMalayalamController.text);
    context.read<DataProvider>().addDonor(_bloodModel).then((value) => {
          Utils().toast(context, 'Successfully added'),
          Navigator.of(context).pop(),
        });
  }

  Future<void> update() async {
    bool _isValid = _formKey.currentState!.validate();

    if (!_isValid) {
      return;
    }
    BloodModel _updateModel = BloodModel(
        gender: gengervalue ?? gender[0],
        age: double.parse(ageController.text),
        bloodGrupe: bloodvalue ?? blodGroup[0],
        collectionId: widget.bloodModel!.collectionId,
        userId: widget.bloodModel!.userId,
        name: nameController.text,
        isApproved: true,
        contact: int.parse(phoneController.text),
        nameInMalayam: nameInMalayalamController.text);
    context.read<DataProvider>().updateDonor(_updateModel).then((value) => {
          Utils().toast(context, 'Successfully  updated'),
          Navigator.of(context).pop(),
          context.read<DataProvider>().setNoteAprovedrList(false),
        });
  }

  void deletDonor() {
    context
        .read<DataProvider>()
        .deleteAddedDonor(widget.bloodModel!.collectionId)
        .then((value) => {
              Utils().toast(context, 'Successfully  deleted'),
              Navigator.of(context).pop(),
              context.read<DataProvider>().setNoteAprovedrList(false),
            });
  }

  @override
  void initState() {
    first();
    super.initState();
  }

  first() {
    if (context.read<DataProvider>().isAdmin) {
      nameController..text = widget.bloodModel?.name ?? '';
      ageController.text = widget.bloodModel?.age.toStringAsFixed(0) ?? '';
      phoneController.text = widget.bloodModel?.contact.toString() ?? '';
      nameInMalayalamController.text = widget.bloodModel?.nameInMalayam ?? '';
      bloodvalue = widget.bloodModel?.bloodGrupe;
      gengervalue = widget.bloodModel?.gender;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Add Details'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  BuildTextField(
                    'Name',
                    TextInputAction.next,
                    TextInputType.name,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    (value) {},
                    false,
                    textEditingController: nameController,
                  ),
                  BuildTextField(
                    'Name Malayalam',

                    TextInputAction.next,
                    TextInputType.name,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    (value) {},
                    false,
                    textEditingController: nameInMalayalamController,
                    // myController,
                  ),
                  BuildTextField(
                    'Age',
                    TextInputAction.next,
                    TextInputType.number,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Add age ';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Add valid age';
                      }
                      if (double.parse(value) <= 17) {
                        return 'Age is Must be Greater 18 ';
                      }

                      return null;
                    },
                    (value) {},
                    false,
                    textEditingController: ageController,
                    // myController,
                  ),
                  BuildTextField(
                    'Contact Number',

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
                    (value) {},
                    false,
                    textEditingController: phoneController,
                    // myController,
                  ),
                  dropDown(
                      onChangedFunction: (value) => setState(() {
                            bloodvalue = value;
                          }),
                      context: context,
                      valueb: bloodvalue,
                      myList: blodGroup),
                  dropDown(
                      onChangedFunction: (value) => setState(() {
                            gengervalue = value;
                          }),
                      context: context,
                      valueb: gengervalue,
                      myList: gender)
                ],
              ),
            ),

            // isAdmin
            //     ?

            context.read<DataProvider>().isAdmin
                ? Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            onPressed: () {
                              update();
                            },
                            child: Text(
                              'Approve',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size(width * 0.5 - 32, 55),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            onPressed: () {
                              deletDonor();
                            },
                            child: Text(
                              'Reject',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              minimumSize: Size(width * 0.5 - 32, 55),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),

            // :

            context.read<DataProvider>().isAdmin
                ? Container()
                : Padding(
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
      required void Function(String?) onChangedFunction,
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
              onChanged: onChangedFunction),
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
