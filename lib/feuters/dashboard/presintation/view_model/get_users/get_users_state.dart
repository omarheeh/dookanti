part of 'get_users_cubit.dart';

@immutable
sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersSucsess extends GetUsersState {
  final List<UserModel> users;
  GetUsersSucsess(this.users);
}

final class GetUsersFailure extends GetUsersState {
  final String errMessage;
  GetUsersFailure(this.errMessage);
}
