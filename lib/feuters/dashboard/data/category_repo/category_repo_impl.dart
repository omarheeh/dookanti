import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/servise/storage_servise.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/dashboard/data/category_repo/category_repo.dart';

class CategoryRepoImpl extends CategoryRepo {
  final StorageService storageService;
  final FireStoreServise fireStoreServise;
  CategoryRepoImpl(this.storageService, this.fireStoreServise);
  @override
  Future<Either<Failure, String>> addCategory(
      {required String name,
      required List<String> partsList,
      required Uint8List file}) async {
    try {
      String url = await storageService.uploadImgaeToStorage(
          name, file, 'categories_image');
      var categorieData = await fireStoreServise.addCategory(body: {
        'name': name,
        'image': url,
      });
      for (int i = 0; i < partsList.length; i++) {
        await fireStoreServise.addPart(
          body: {
            'name': partsList[i],
          },
          id: categorieData.id,
        );
      }
      return right('sucsess');
    } catch (e) {
      return left(FireBaseFailure('error in add category'));
    }
  }
}
