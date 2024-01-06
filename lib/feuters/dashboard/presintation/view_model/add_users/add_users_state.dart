part of 'add_users_cubit.dart';

@immutable
sealed class AddUsersState {}

final class AddUsersInitial extends AddUsersState {}

final class AddUsersLoading extends AddUsersState {}

final class AddUsersSucsess extends AddUsersState {
  UserModel userModel;
  AddUsersSucsess(this.userModel);
}

final class AddUsersFailure extends AddUsersState {
  final String errMessgae;
  AddUsersFailure(this.errMessgae);
}
