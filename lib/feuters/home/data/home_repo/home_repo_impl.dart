import 'package:dartz/dartz.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/home/data/home_repo/home_repo.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';

class HomeRepoImpl extends HomeRepo {
  final FireStoreServise fireStoreServise;
  HomeRepoImpl(this.fireStoreServise);
  @override
  Future<Either<Failure, List<CategoriesModel>>> getCategories() async {
    try {
      var data = await fireStoreServise.get(collection: 'categories');

      List<CategoriesModel> categoriesModel = [];
      for (int i = 0; i < data.docs.length; i++) {
        var dataPart = await fireStoreServise.getPart(
          firestCollection: 'categories',
          lastCollection: 'parts',
          id: data.docs[i].id,
        );

        categoriesModel.add(
          CategoriesModel.jsonData(
            data.docs[i],
            dataPart,
          ),
        );
      }
      return right(categoriesModel);
    } catch (e) {
      return left(FireBaseFailure('error in get categories'));
    }
  }
}