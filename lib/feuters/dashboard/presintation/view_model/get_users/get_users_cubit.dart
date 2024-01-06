import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:dookanti/feuters/dashboard/data/dashboard_repo/dashboard_repo_impl.dart';
import 'package:meta/meta.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  DashBoardRepoImpl dashBoardRepoImpl;
  GetUsersCubit(this.dashBoardRepoImpl) : super(GetUsersInitial());

  Future<void> getUsers() async {
    emit(GetUsersLoading());
    var result = await dashBoardRepoImpl.getUsers();
    result.fold(
      (failure) => emit(GetUsersFailure(failure.errMessage)),
      (users) => emit(GetUsersSucsess(users)),
    );
  }
}
