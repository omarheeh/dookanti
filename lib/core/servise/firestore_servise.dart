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
      'status': 'active',
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

  Future<dynamic> search({required List<String> text}) async {
    var data = await firebaseFirestore
        .collection('products')
        .where('search', arrayContainsAny: text)
        .get();
    return data;
  }

  Future<dynamic> getOrders({required String email}) async {
    var data = await firebaseFirestore
        .collection('orders')
        .where('email', isEqualTo: email)
        .get();

    return data;
  }

  Future<dynamic> changeStutus(
      {required String id, required String stutus}) async {
    var data = await firebaseFirestore.collection('users').doc(id).update({
      'status': stutus,
    });
    return data;
  }

  Future<dynamic> getStatus({required String id}) async {
    var data = await firebaseFirestore.collection('users').doc(id).get();
    return data;
  }

  Future<dynamic> addCategory({required Map<String, dynamic> body}) async {
    var data = await firebaseFirestore.collection('categories').add(body);
    return data;
  }

  Future<dynamic> addPart(
      {required Map<String, dynamic> body, required String id}) async {
    var data = await firebaseFirestore
        .collection('categories')
        .doc(id)
        .collection('parts')
        .add(body);
    return data;
  }

  Future<dynamic> addProduct({required Map<String, dynamic> body}) async {
    var data = await firebaseFirestore.collection('products').add(body);
    return data;
  }
}
