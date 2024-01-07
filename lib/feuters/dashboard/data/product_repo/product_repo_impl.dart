import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/servise/storage_servise.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/dashboard/data/product_repo/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final StorageService storageService;
  final FireStoreServise fireStoreServise;
  ProductRepoImpl(this.storageService, this.fireStoreServise);
  @override
  Future<Either<Failure, String>> addProduct({
    required String name,
    required String price,
    required String quantity,
    required Uint8List file,
    required String cId,
    required String cName,
    required String pId,
    required String pName,
  }) async {
    try {
      String url = await storageService.uploadImgaeToStorage(
          name, file, 'productsImages');
      var data = await fireStoreServise.addProduct(body: {
        'categoriesId': cId,
        'categoriesName': cName,
        'image': url,
        'name': name,
        'partId': pId,
        'partName': pName,
        'price': price,
        'quantity': num.parse(quantity),
        'search': name.split(' '),
      });
      return right('sucsess');
    } catch (e) {
      return left(FireBaseFailure('error in add product'));
    }
  }
}
