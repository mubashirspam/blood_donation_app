
import 'package:blood_donation/model/blood_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference bloodRef =
      FirebaseFirestore.instance.collection('bloodCollection');

  Future<void> addDonor({required BloodModel bloodModel}) async {
    await bloodRef.doc(bloodModel.collectionId).set(bloodModel.toJson(bloodModel));
  }

  Future<List<BloodModel>> getDonorList() async {
    final donorList = await bloodRef.get().then((value) {
      return value.docs
          .map((doc) => BloodModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
    return donorList;
  }

  Future<List<BloodModel>> getAddedDonorList(String userId) async {
    final userList =
        await bloodRef.where('userId', isEqualTo: userId).get().then((value) {
              return value.docs
                  .map((doc) =>
                      BloodModel.fromJson(doc.data() as Map<String, dynamic>))
                  .toList();
            });
    return userList;
  }

  Future<void> updateDonor(BloodModel bloodModel) async {
    await bloodRef
        .doc(bloodModel.collectionId)
        .update(bloodModel.toJson(bloodModel) as Map<String, dynamic>);
  }

  Future<void> deleteDonor(String  collectionId) async {
    return await bloodRef.doc(collectionId).delete();
  }
}
