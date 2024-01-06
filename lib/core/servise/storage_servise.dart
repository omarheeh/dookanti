import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage firebaseStorage;
  StorageService(this.firebaseStorage);

  Future<String> uploadImgaeToStorage(String childName, Uint8List file) async {
    Reference ref = firebaseStorage.ref('categories_image').child(childName);
    UploadTask uploadTask =
        ref.putData(file, SettableMetadata(contentType: 'image/png'));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
