import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServise {
  FirebaseFirestore firebaseFirestore;
  FireStoreServise(this.firebaseFirestore);
  Future<dynamic> getUser(
      {required String collection, required String where}) async {
    var data = await firebaseFirestore
        .collection(collection)
        .where('email', isEqualTo: where)
        .get();
    return data;
  }
}
