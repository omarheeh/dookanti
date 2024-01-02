import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:dookanti/feuters/home/data/models/cart_item_model.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/products/data/cart_repo/cart_repo_impl.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepoImpl cartRepoImpl;
  CartCubit(this.cartRepoImpl) : super(CartInitial());
  Map<String, CartItemModel> cartItem = {};

  void addItemToCart(ProductModel productModel) {
    emit(CartAdd());
    if (cartItem.containsKey(productModel.productId)) {
      cartItem[productModel.productId]!.count++;
    } else {
      cartItem[productModel.productId] = CartItemModel(
        productModel: productModel,
        count: 1,
      );
    }
    emit(CartAddDone());
  }

  void removeItemFromCart(ProductModel productModel, int quantityToRemove) {
    emit(CartRemove());
    if (cartItem.containsKey(productModel.productId)) {
      CartItemModel cartItemModel = cartItem[productModel.productId]!;
      if (quantityToRemove >= cartItemModel.count) {
        cartItem.remove(productModel.productId);
      } else {
        cartItem[productModel.productId]!.count -= quantityToRemove;
      }
    }
    emit(CartRemoveDone());
  }

  int getProductCount(ProductModel productModel) {
    return cartItem.containsKey(productModel.productId)
        ? cartItem[productModel.productId]!.count
        : 0;
  }

  List<CartItemModel> listProducts() {
    return cartItem.values.toList();
  }

  int cartLength() {
    return cartItem.length;
  }

  double sumPrice() {
    double sum = 0;
    cartItem.forEach((key, value) {
      sum += double.parse(value.productModel.price) * value.count;
    });
    return sum;
  }

  Future<void> sendOreder(
      {required String email, required String username}) async {
    emit(CartSendLoading());
    Map<String, dynamic> data = {};
    cartItem.forEach((key, value) {
      data[key] = value.toJson();
    });
    var result = await cartRepoImpl.addOrder(body: {
      'orders': data,
      'email': email,
      'username': username,
      'data': DateTime.now(),
    });
    result.fold((failure) => emit(CartSendSucsess(failure.errMessage)),
        (sucsess) => emit(CartSendSucsess(sucsess)));
    log(data.toString());
  }
}
