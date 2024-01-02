import 'package:dartz/dartz.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/products/data/tap_repo/tap_repo.dart';

class TapRepoImpl extends TapRepo {
  final FireStoreServise fireStoreServise;
  TapRepoImpl(this.fireStoreServise);

  @override
  Future<Either<Failure, List<ProductModel>>> getproducts(
      {required String partId}) async {
    try {
      List<ProductModel> products = [];
      var data = await fireStoreServise.getProducts(
        collection: 'products',
        partId: partId,
      );
      for (int i = 0; i < data.docs.length; i++) {
        products.add(ProductModel.fromJson(data.docs[i]));
      }
      return right(products);
    } catch (e) {
      return left(FireBaseFailure('error in get products'));
    }
  }
}
