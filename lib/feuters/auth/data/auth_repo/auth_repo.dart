import 'package:dartz/dartz.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> singin(
      {required String emailAddress, required String password});
  Future<void> signOut();

  Future<Either<Failure, UserModel>> Regester(
      {required String email,
      required String username,
      required String password});
}
