import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class StatusCard with ChangeNotifier {
  final String id;
  final String name;
  final double contact;
  final double age;
  final String bloodGrupe;
  final String nameInMalayam;
  final String gender;
  bool isApproved;

  StatusCard(
      {required this.gender,
      required this.age,
      required this.bloodGrupe,
      required this.id,
      required this.name,
      required this.contact,
      required this.nameInMalayam,
      this.isApproved = false});

  Future<void> toggleFavoriteStatus() async {
    final oldStatus = false;

    notifyListeners();
    CollectionReference users =
        FirebaseFirestore.instance.collection('BloodStatusCards');

    try {
      await users.doc(id).update({"isApproved": !isApproved});
    } catch (e) {
      isApproved = oldStatus;

      print(e);
      notifyListeners();
    }
  }
}

class BloodStatusCards with ChangeNotifier {
  CollectionReference users =
      FirebaseFirestore.instance.collection('BloodStatusCards');
  List<StatusCard> _items = [];
  List<StatusCard> get item {
    return [..._items];
  }

  List<StatusCard> get approvedItems {
    return _items.where((cardItem) => cardItem.isApproved).toList();
  }

  List<StatusCard> get notapprovedItems {
    return _items.where((cardItem) => cardItem.isApproved == false).toList();
  }

  StatusCard findById(String id) {
    return _items.firstWhere((card) => card.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    // CollectionReference users =
    //     FirebaseFirestore.instance.collection('BloodStatusCards');

    try {
      final List<StatusCard> loadedData = [];
      var response = await users.get().then((value) => value.docs);

     

      response.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;

        

        loadedData.add(StatusCard(
            id: element.id,
            name: data['name'],
            nameInMalayam: data["nameInMalayam"],
            age: data["age"],
            contact: data["contact"],
            gender: data['gender'],
            bloodGrupe: data['bloodGrupe'],
            isApproved: data['isApproved']));
      });

      _items = loadedData;
      notifyListeners();
    } catch (error) {
      print(error);
      // return;
      throw error;
    }
  }

  Future<void> addCard(StatusCard bloodCard) async {
    try {
      final response = await users.add(
        {
          'name': bloodCard.name,
          'nameInMalayam': bloodCard.nameInMalayam,
          'contact': bloodCard.contact,
          'gender': bloodCard.gender,
          'age': bloodCard.age,
          'bloodGrupe': bloodCard.bloodGrupe,
          'isApproved': bloodCard.isApproved,
        },
      );
      final newBloodCard = StatusCard(
          id: response.id,
          name: bloodCard.name,
          contact: bloodCard.contact,
          gender: bloodCard.gender,
          nameInMalayam: bloodCard.nameInMalayam,
          age: bloodCard.age,
          bloodGrupe: bloodCard.bloodGrupe,
          isApproved: bloodCard.isApproved);

      _items.add(newBloodCard);

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateCard(String id, StatusCard newBloodCard) async {
    final cardIndex = _items.indexWhere((element) => element.id == id);
    print("-----id---- : ${id}");
    if (cardIndex >= 0) {
      await users
          .doc(id)
          .update(
            {
              'name': newBloodCard.name,
              'nameInMalayam': newBloodCard.nameInMalayam,
              'contact': newBloodCard.contact,
              'gender': newBloodCard.gender,
              'age': newBloodCard.age,
              'bloodGrupe': newBloodCard.bloodGrupe,
            },
          )
          .then((value) => print("User Updated"))
          .catchError(
            (error) => print("Failed to update user: $error"),
          );

      _items[cardIndex] = newBloodCard;
      notifyListeners();
    } else {
      print('.....');
    }
  }

  void deleteCard(String id) {
    final existingCardIndex = _items.indexWhere((element) => element.id == id);
    StatusCard? existingCard = _items[existingCardIndex];
    _items.removeAt(existingCardIndex);
    notifyListeners();
    users.doc(id).delete().then((_) => existingCard = null).catchError((_) {
      _items.insert(
        existingCardIndex,
        existingCard!,
      );
      notifyListeners();
    });
  }
}
