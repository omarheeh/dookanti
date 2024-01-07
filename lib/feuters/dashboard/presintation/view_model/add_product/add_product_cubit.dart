import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/dashboard/data/product_repo/product_repo_impl.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  ProductRepoImpl productRepoImpl;

  AddProductCubit(this.productRepoImpl) : super(AddProductInitial());
  Uint8List? file;
  String? cId;
  String? cName;
  String? pId;
  String? pName;
  Future<void> addProduct(
      {required String name,
      required String price,
      required String quantity}) async {
    if (name != '' &&
        price != '' &&
        quantity != '' &&
        file != null &&
        cId != null &&
        cName != null &&
        pId != null &&
        pName != null) {
      emit(AddProductLoading());
      var result = await productRepoImpl.addProduct(
        name: name,
        price: price,
        quantity: quantity,
        file: file!,
        cId: cId!,
        cName: cName!,
        pId: pId!,
        pName: pName!,
      );
      result.fold(
        (failure) => emit(AddProductFailure(failure.errMessage)),
        (message) => emit(AddProductSucsess()),
      );
    } else {
      emit(AddProductFailure('error'));
    }
  }
}
