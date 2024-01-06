import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'add_users_state.dart';

class AddUsersCubit extends Cubit<AddUsersState> {
  AuthRepoImpl authRepoImpl;
  AddUsersCubit(this.authRepoImpl) : super(AddUsersInitial());

  Future<void> adduser(
      {required String username,
      required String password,
      required String email}) async {
    var data = await authRepoImpl.Regester(
        email: email, username: username, password: password);
    data.fold(
      (failure) => emit(AddUsersFailure(failure.errMessage)),
      (user) => emit(AddUsersSucsess(user)),
    );
  }
}
