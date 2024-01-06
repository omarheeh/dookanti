import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/dashboard/data/category_repo/category_repo_impl.dart';
import 'package:meta/meta.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  CategoryRepoImpl categoryRepoImpl;
  AddCategoryCubit(this.categoryRepoImpl) : super(AddCategoryInitial());
  List<String> partsList = [];
  Uint8List? file;

  Future<void> addCategory({required String name}) async {
    emit(AddCategoryLoading());
    var result = await categoryRepoImpl.addCategory(
        name: name, partsList: partsList, file: file!);

    result.fold(
        (l) => emit(AddCategoryFailure()), (r) => emit(AddCategorySucsess()));
  }
}
