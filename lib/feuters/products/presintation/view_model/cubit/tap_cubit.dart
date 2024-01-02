import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/products/data/tap_repo/tap_repo_impl.dart';
import 'package:meta/meta.dart';

part 'tap_state.dart';

class TapCubit extends Cubit<TapState> {
  final TapRepoImpl tapRepoImpl;
  TapCubit(this.tapRepoImpl) : super(TapInitial());
  Future<void> getProducts({required String partId}) async {
    emit(TapLoading());
    var result = await tapRepoImpl.getproducts(partId: partId);
    result.fold((failure) => emit(TapFailure(failure.errMessage)),
        (productsList) => emit(TapSucsess(productsList)));
  }
}
