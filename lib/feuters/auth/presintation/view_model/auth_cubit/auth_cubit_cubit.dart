import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  final AuthRepoImpl authRepoImpl;
  AuthCubitCubit(this.authRepoImpl) : super(AuthCubitInitial());
  UserModel? userModel;

  Future<void> singin({required String email, required String password}) async {
    emit(AuthCubitLoading());
    var result = await authRepoImpl.singin(
      emailAddress: email,
      password: password,
    );
    result.fold(
      (failure) => emit(
        AuthCubitFailure(failure.errMessage),
      ),
      (user) {
        userModel = user;
        log(userModel!.email);
        emit(AuthCubitSucsess());
      },
    );
  }

  Future<void> regester(
      {required String email,
      required String password,
      required String username}) async {
    emit(AuthCubitLoading());
    var result = await authRepoImpl.Regester(
      email: email,
      username: username,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthCubitFailure(failure.errMessage)),
      (user) {
        userModel = user;
        emit(AuthCubitSucsess());
      },
    );
  }

  Future<void> signOut() async {
    await authRepoImpl.signOut();
    userModel = null;
    emit(AuthCubitInitial());
  }

  bool isLogin() {
    if (userModel != null) {
      return true;
    } else {
      return false;
    }
  }
}
