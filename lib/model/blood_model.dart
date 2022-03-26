class BloodModel {
  late String collectionId;
  late String userId;
  late String name;
  late int contact;
  late double age;
  late String bloodGrupe;
  late String nameInMalayam;
  late String gender;
  late bool isApproved;

  BloodModel(
      {required this.gender,
      required this.age,
      required this.bloodGrupe,
      required this.collectionId,
      required this.userId,
      required this.name,
      required this.contact,
      required this.nameInMalayam,
      this.isApproved = false});

  Map toJson(BloodModel bloodModel) {

    var data = Map<String, dynamic>();
    data['userId'] = userId;
    data['collectionId'] = collectionId;
    data['name'] = name;
    data['nameInMalayam'] = nameInMalayam;
    data['contact'] = contact;
    data['gender'] = gender;
    data['age'] = age;
    data['bloodGrupe'] = bloodGrupe;
    data['isApproved'] = isApproved;

    return data;
  }

  BloodModel.fromJson(Map<String, dynamic> data) {

    userId = data['userId'];
    collectionId = data['collectionId'];
    name = data['name'];
    nameInMalayam = data['nameInMalayam'];
    contact = data['contact'];
    gender = data['gender'];
    age = data['age'];
    bloodGrupe = data['bloodGrupe'];
    isApproved = data['isApproved'];
    
  }
}
