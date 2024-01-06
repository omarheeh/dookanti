import 'package:dartz/dartz.dart';
import 'package:dookanti/core/servise/auth_servise.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/auth/data/auth_repo/auth_repo.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthServise authServise;
  final FireStoreServise fireStoreServise;
  AuthRepoImpl(
    this.authServise,
    this.fireStoreServise,
  );
  @override
  Future<Either<Failure, UserModel>> singin({
    required String emailAddress,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await authServise.singin(
        emailAddress: emailAddress,
        password: password,
      );
      var userData = await fireStoreServise.getUser(
        collection: 'users',
        where: userCredential.user!.email!,
      );

      return right(
        UserModel(
          userId: userData.docs[0].id,
          email: userCredential.user!.email!,
          username: userData.docs[0]['username'],
          isAdmin: password == 'adminadmin' ? true : false,
          status: userData.docs[0]['status'] == 'active' ? true : false,
        ),
      );
    } catch (e) {
      return left(FireBaseFailure('login is failure'));
    }
  }

  @override
  Future<void> signOut() async {
    authServise.signOut();
  }

  @override
  Future<Either<Failure, UserModel>> Regester(
      {required String email,
      required String username,
      required String password}) async {
    try {
      UserCredential userCredential =
          await authServise.regester(emailAddress: email, password: password);
      var data =
          await fireStoreServise.createUser(email: email, username: username);
      return right(
        UserModel(
          userId: '',
          username: username,
          email: userCredential.user!.email!,
          isAdmin: password == 'adminadmin' ? true : false,
          status: true,
        ),
      );
    } catch (e) {
      return left(FireBaseFailure('error in regestir'));
    }
  }
}
