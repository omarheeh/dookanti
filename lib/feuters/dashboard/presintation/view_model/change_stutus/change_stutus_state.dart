part of 'change_stutus_cubit.dart';

@immutable
sealed class ChangeStutusState {}

final class ChangeStutusInitial extends ChangeStutusState {}

final class ChangeStutusStartChange extends ChangeStutusState {}

final class ChangeStutusEndChange extends ChangeStutusState {}

final class ChangeStutusFailure extends ChangeStutusState {
  final String errMessage;
  ChangeStutusFailure(this.errMessage);
}
