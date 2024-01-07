import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';

abstract class DashBoardRepo {
  Future<Either<Failure, List<UserModel>>> getUsers();
  Future<Either<Failure, bool>> updateStutus(
      {required String id, required bool stutus});
  Future<Either<Failure, bool>> getStutus({required String id});
  Future<Either<Failure, List<CategoriesModel>>> getCategories();
}
