import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/dashboard/data/dashboard_repo/dashboard_repo_impl.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:meta/meta.dart';

part 'get_category_list_state.dart';

class GetCategoryListCubit extends Cubit<GetCategoryListState> {
  DashBoardRepoImpl dashBoardRepoImpl;
  GetCategoryListCubit(this.dashBoardRepoImpl)
      : super(GetCategoryListInitial());

  List<CategoriesModel> categories = [];

  Future<void> getCategories() async {
    emit(GetCategoryListLoading());
    var result = await dashBoardRepoImpl.getCategories();
    result.fold(
      (failure) => emit(GetCategoryListFailure(failure.errMessage)),
      (categoriesList) {
        categories = categoriesList;
        emit(GetCategoryListSucsess());
      },
    );
  }
}
