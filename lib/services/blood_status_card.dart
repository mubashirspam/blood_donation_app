import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  StatusCard findById(String id) {
    return _items.firstWhere((card) => card.id == id);
  }
   

  

  Future<void> fetchAndSetProducts() async {
   
    CollectionReference users =
        FirebaseFirestore.instance.collection('BloodStatusCards');

    try {
      String documentId='';
      final response = await users.doc(documentId).get();
      final Map<String, dynamic>  extractedData =  response.data() as Map<String, dynamic>;
      final List<StatusCard> loadedData = [];
      extractedData.forEach((cardId, cardData) {
        loadedData.add(
          StatusCard(
            id: cardId,
            name: cardData['name'],
            nameInMalayam: cardData["nameInMalayam"],
            age: cardData["age"],
            contact: cardData["contact"],
            gender: cardData['gender'],
            bloodGrupe: cardData['bloodGrupe'],
          ),
        );
      });
      _items = loadedData;
      notifyListeners();
    } catch (error) {
      print(error);
     throw error;
    }
  }

  Future<void> addCard(StatusCard bloodCard) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('BloodStatusCards');
    try {
      final response = await users.add(
        {
          'name': bloodCard.name,
          'nameInMalayam': bloodCard.nameInMalayam,
          'contact': bloodCard.contact,
          'gender': bloodCard.gender,
          'age': bloodCard.age,
          'bloodGrupe': bloodCard.bloodGrupe,
        },
      );
      final newBloodCard = StatusCard(
          id: response.id,
          name: bloodCard.name,
          contact: bloodCard.contact,
          gender: bloodCard.gender,
          nameInMalayam: bloodCard.nameInMalayam,
          age: bloodCard.age,
          bloodGrupe: bloodCard.bloodGrupe);

      _items.add(newBloodCard);

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void updateCard(String id, StatusCard newBloodCard) {
    final cardIndex = _items.indexWhere((element) => element.id == id);
    if (cardIndex >= 0) {
      _items[cardIndex] = newBloodCard;
      notifyListeners();
    } else {
      print('.....');
    }
  }

  void deleteCard(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

// Widget build(BuildContext context) {
//   CollectionReference users = FirebaseFirestore.instance.collection('users');

//   return FutureBuilder<DocumentSnapshot>(
//     future: users.doc(documentId).get(),
//     builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//       if (snapshot.hasError) {
//         return Text("Something went wrong");
//       }

//       if (snapshot.hasData && !snapshot.data!.exists) {
//         return Text("Document does not exist");
//       }

//       if (snapshot.connectionState == ConnectionState.done) {
//         Map<String, dynamic> data =
//             snapshot.data!.data() as Map<String, dynamic>;
//         return Text("Full Name: ${data['full_name']} ${data['last_name']}");
//       }

//       return Text("loading");
//     },
//   );
// }
