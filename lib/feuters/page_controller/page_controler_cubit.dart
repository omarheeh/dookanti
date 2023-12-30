import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_controler_state.dart';

class PageControlerCubit extends Cubit<PageControlerState> {
  PageControlerCubit() : super(PageControlerHome());
  final int current_page = 0;
  void ChangePage(String route) {
    if (route == 'home') {
      emit(PageControlerHome());
    } else if (route == 'tabView') {
      emit(PageControlerTabView());
    }
  }
}
