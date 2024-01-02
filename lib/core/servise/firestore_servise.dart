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

  Future<dynamic> createUser(
      {required String email, required String username}) async {
    var data = await firebaseFirestore.collection('users').add({
      'email': email,
      'username': username,
    });

    return data;
  }

  Future<dynamic> get({required String collection}) async {
    var data = firebaseFirestore.collection(collection).get();
    return data;
  }

  Future<dynamic> getPart(
      {required String firestCollection,
      required String lastCollection,
      required String id}) async {
    var data = await firebaseFirestore
        .collection(firestCollection)
        .doc(id)
        .collection(lastCollection)
        .get();
    return data;
  }

  Future<dynamic> getProducts(
      {required String collection, required String partId}) async {
    var data = await firebaseFirestore
        .collection(collection)
        .where('partId', isEqualTo: partId)
        .get();
    return data;
  }

  Future<void> add({required Map<String, dynamic> body}) async {
    await firebaseFirestore.collection('orders').add(body);
  }
}
