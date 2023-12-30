part of 'page_controler_cubit.dart';

@immutable
sealed class PageControlerState {}

final class PageControlerInitial extends PageControlerState {}

final class PageControlerHome extends PageControlerState {}

final class PageControlerTabView extends PageControlerState {}
