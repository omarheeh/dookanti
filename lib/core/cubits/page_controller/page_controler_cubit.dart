import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/home/presentaiton/view/home_view.dart';
import 'package:dookanti/feuters/products/presintation/view/tab_view.dart';
import 'package:meta/meta.dart';

part 'page_controler_state.dart';

class PageControlerCubit extends Cubit<PageControlerState> {
  PageControlerCubit() : super(PageControlerHome());
  final int current_page = 0;
  void ChangePage(String route) {
    if (route == HomeView.id) {
      emit(PageControlerHome());
    } else if (route == TabView.id) {
      emit(PageControlerTabView());
    }
  }
}