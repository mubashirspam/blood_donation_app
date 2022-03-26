import 'package:blood_donation/controller/firebase_api.dart';
import 'package:blood_donation/model/blood_model.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  List<BloodModel> _addedBloodList = [];
  List<BloodModel> _bloodList = [];
  bool _isLoading = false;

  List<BloodModel> get getBloodList => _bloodList;
  List<BloodModel> get getAddedBloodList => _addedBloodList;
  bool get isLoading => _isLoading;

  Future<void> addDonor(BloodModel bloodModel) async {
    await FirebaseApi().addDonor(bloodModel: bloodModel);
  }

  void setDonorList(String storeId) async {
    _isLoading = true;
    await FirebaseApi().getDonorList().then((value) {
      _bloodList = value;
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

  void updateDonor(BloodModel bloodModel) async {
    await FirebaseApi().updateDonor(bloodModel).then((value) {});
  }

  Future<void> deleteDonor(String collectionId) async {
    return await FirebaseApi().deleteDonor(collectionId);
  }
}
