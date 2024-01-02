import 'package:dookanti/feuters/home/data/models/product_model.dart';

class CartItemModel {
  final ProductModel productModel;
  int count;

  CartItemModel({
    required this.productModel,
    required this.count,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': productModel.toJson(),
      'count': count,
    };
  }
}
