import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  final AuthRepoImpl authRepoImpl;
  AuthCubitCubit(this.authRepoImpl) : super(AuthCubitInitial());
  final UserModel? userModel = null;

  Future<void> singin({required String email, required String password}) async {
    emit(AuthCubitInitial());
    var result = await authRepoImpl.singin(
      emailAddress: email,
      password: password,
    );
    result.fold(
      (failure) => emit(
        AuthCubitFailure(failure.errMessage),
      ),
      (userModel) {
        userModel = userModel;
        emit(AuthCubitSucsess());
      },
    );
  }
}
