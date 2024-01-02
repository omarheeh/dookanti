import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  HomeRepoImpl homeRepoImpl;
  CategoriesCubit(this.homeRepoImpl) : super(CategoriesInitial());
  List<CategoriesModel> categories = [];

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepoImpl.getCategories();
    result.fold(
      (failure) => emit(CategoriesFailure(failure.errMessage)),
      (categoriesList) {
        categories = categoriesList;
        emit(CategoriesSucsess());
      },
    );
  }
}
