import 'blood_card.dart';
import 'package:flutter/material.dart';

class BloodCards with ChangeNotifier {
  List<BloodCard> _items = [
    BloodCard(
        id: 'b1',
        name: 'Mubashir Ahammed',
        nameInMalayam: 'Mubashir Ahammed',
        bloodGroup: 'O+',
        age: 22,
        contact: 9562229979,
        gender: 'male'),
    BloodCard(
        id: 'b2',
        name: 'Nizamudheen',
        nameInMalayam: 'Nizamudheen',
        bloodGroup: 'O+',
        age: 22,
        contact: 9562229979,
        gender: 'male'),
    BloodCard(
        id: 'b3',
        name: 'Akbar cp',
        nameInMalayam: 'Akbar cp',
        bloodGroup: 'O+',
        age: 24,
        contact: 9562229979,
        gender: 'male'),
  ];
  List<BloodCard> get items {
    return [..._items];
  }
  BloodCard findById(String id) {
    return _items.firstWhere((blood) => blood.id == id);
  }

  
  // void updateBloodcard(String id, BloodCard newBloodcard) {
  //   final bloodIndex = _items.indexWhere((element) => element.id == id);
  //   if (bloodIndex >= 0) {
  //     _items[bloodIndex] = newBloodcard;
  //     notifyListeners();
  //   } else {
  //     print('.....');
  //   }
  // }
}
