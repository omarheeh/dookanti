import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  HomeRepoImpl homeRepoImpl;
  SearchCubit(this.homeRepoImpl) : super(SearchInitial());

  Future<void> search({required String text}) async {
    emit(SearchLoading());
    var result = await homeRepoImpl.search(text: text.split(' '));
    result.fold(
      (failure) => emit(
        SearchFailure(failure.errMessage),
      ),
      (products) => emit(
        SearchSucsess(products),
      ),
    );
  }
}
