import 'package:blood_donation/controller/firebase_api.dart';
import 'package:blood_donation/model/blood_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  List<BloodModel> _addedBloodList = [];
  List<BloodModel> _bloodList = [];
  List<BloodModel> _NoteAprovedList = [];
  bool _isLoading = false;
  bool _isAdmin = false;

  String _searchBloodGroup = '';

  List<BloodModel> get getBloodList => _bloodList;
  List<BloodModel> get getAddedBloodList => _addedBloodList;
  List<BloodModel> get getNoteAprovedList => _NoteAprovedList;
  bool get isLoading => _isLoading;
  bool get isAdmin => _isAdmin;


  Future<void> addDonor(BloodModel bloodModel) async {
    await FirebaseApi().addDonor(bloodModel: bloodModel);
  }


  void setSerchBloodGroup(String bloodGroup) {
    _searchBloodGroup = bloodGroup;
    notifyListeners();
  }
  
  
  void setDonorList(bool bool) async {
    _isLoading = true;
    await FirebaseApi().getDonorList(bool).then((value) {
      getisAdmin();
      _bloodList = value;
      _isLoading = false;
      notifyListeners();
    });
  }

  void searchDoner(bool bool,) async {
    _isLoading = true;
    await FirebaseApi().serchDoner(_searchBloodGroup).then((value) {
      getisAdmin();
      _bloodList = value;
      _isLoading = false;
      notifyListeners();
    });
  }

  void setNoteAprovedrList(bool bool) async {
    _isLoading = true;
    await FirebaseApi().getDonorList(bool).then((value) {
      getisAdmin();
      _NoteAprovedList = value;
      _isLoading = false;
      notifyListeners();
    });
  }

  void setAddedDonorList(String userId) async {
    _isLoading = true;
    await FirebaseApi().getAddedDonorList(userId).then((value) {
      _addedBloodList = value;

      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> updateDonor(BloodModel bloodModel) async {
    await FirebaseApi().updateDonor(bloodModel).then((value) {});
  }

  Future<void> deleteDonor(String collectionId) async {
    return await FirebaseApi().deleteDonor(collectionId);
  }

  getisAdmin() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user?.email == 'admin@gmail.com') {
      print('callled');
      _isAdmin = true;
    } else {
      _isAdmin = false;
    }
    notifyListeners();
  }

  Future<void> deleteAddedDonor(String collectionId) async {
    return await FirebaseApi().deleteDonor(collectionId);
  }
}
