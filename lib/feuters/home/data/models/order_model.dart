import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/feuters/home/data/models/cart_item_model.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';

class OrderModel {
  final Timestamp date;
  final String email;
  final num sumPrice;
  final String userName;
  final List<CartItemModel> cartItemModel;

  OrderModel({
    required this.date,
    required this.email,
    required this.sumPrice,
    required this.userName,
    required this.cartItemModel,
  });
  factory OrderModel.fromJson(jsonData) {
    List<CartItemModel> cartItemModel = [];
    jsonData['orders'].forEach((key, value) {
      cartItemModel.add(CartItemModel(
        productModel: ProductModel(
          name: value['product']['name'],
          productId: value['product']['productId'],
          categoriesId: value['product']['categoriesId'],
          categoriesName: value['product']['categoriesName'],
          image: value['product']['image'],
          partId: value['product']['partId'],
          partName: value['product']['partName'],
          price: value['product']['price'],
          quantity: value['product']['quantity'],
        ),
        count: value['count'],
      ));
    });
    return OrderModel(
      date: jsonData['data'],
      email: jsonData['email'],
      sumPrice: jsonData['sumPrice'],
      userName: jsonData['username'],
      cartItemModel: cartItemModel,
    );
  }
}
