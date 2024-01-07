import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:dookanti/feuters/dashboard/data/dashboard_repo/dashboard_repo.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';

class DashBoardRepoImpl extends DashBoardRepo {
  final FireStoreServise fireStoreServise;
  DashBoardRepoImpl(this.fireStoreServise);
  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      var users = await fireStoreServise.get(collection: 'users');
      List<UserModel> usersModel = [];
      for (int i = 0; i < users.docs.length; i++) {
        usersModel.add(UserModel(
          userId: users.docs[i].id,
          username: users.docs[i]['username'],
          email: users.docs[i]['email'],
          status: users.docs[i]['status'] == 'active' ? true : false,
        ));
      }
      return right(usersModel);
    } catch (e) {
      return left(FireBaseFailure('error in get users'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateStutus(
      {required String id, required bool stutus}) async {
    try {
      await fireStoreServise.changeStutus(
          id: id, stutus: stutus ? 'active' : 'block');
      var data = await fireStoreServise.getStatus(id: id);
      bool isActive = data.data()['status'] == 'active' ? true : false;
      return right(isActive);
    } catch (e) {
      return left(FireBaseFailure('error'));
    }
  }

  @override
  Future<Either<Failure, bool>> getStutus({required String id}) async {
    try {
      var data = await fireStoreServise.getStatus(id: id);
      bool isActive = data.data()['status'] == 'active' ? true : false;
      return right(isActive);
    } catch (e) {
      return left(FireBaseFailure('error'));
    }
  }

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
