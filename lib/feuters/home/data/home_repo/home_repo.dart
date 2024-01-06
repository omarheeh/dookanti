import 'package:dartz/dartz.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/home/data/models/order_model.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesModel>>> getCategories();
  Future<Either<Failure, List<ProductModel>>> search(
      {required List<String> text});
  Future<Either<Failure, List<OrderModel>>> getOrders({required String email});
}
