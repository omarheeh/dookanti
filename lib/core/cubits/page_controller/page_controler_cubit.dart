import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/home/presentaiton/view/home_view.dart';
import 'package:dookanti/feuters/home/presentaiton/view/search_view.dart';
import 'package:dookanti/feuters/products/presintation/view/tab_view.dart';
import 'package:meta/meta.dart';

part 'page_controler_state.dart';

class PageControlerCubit extends Cubit<PageControlerState> {
  PageControlerCubit() : super(PageControlerHome());
  final int current_page = 0;
  void ChangePage({required String route, CategoriesModel? categoriesModel}) {
    if (route == HomeView.id) {
      emit(PageControlerHome());
    } else if (route == TabView.id) {
      emit(PageControlerTabView(categoriesModel!));
    } else if (route == SearchView.id) {
      emit(PageControlerSearch());
    }
  }
}
