
import 'package:flutter/material.dart';

class StatusCard {
  final String id;
  final String name;
  final double contact;
  final double age;
  final String bloodGrupe;
  final String nameInMalayam;

  final String gender;

  StatusCard({
    required this.gender,
    required this.age,
    required this.bloodGrupe,
    required this.id,
    required this.name,
    required this.contact,
    required this.nameInMalayam,
  });
}

class BloodStatusCards with ChangeNotifier {
  List<StatusCard> _items = [];
  List<StatusCard> get item {
    return [..._items];
  }
  

  void addCard(StatusCard bloodCard) {
    final newBloodCard = StatusCard(
        id: DateTime.now().toString(),
        name: bloodCard.name,
        contact: bloodCard.contact,
        gender: bloodCard.gender,
        nameInMalayam: bloodCard.nameInMalayam,
        age: bloodCard.age,
        bloodGrupe: bloodCard.bloodGrupe);

    _items.add(newBloodCard);

    notifyListeners();
  }
void deleteCard(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
  
}
