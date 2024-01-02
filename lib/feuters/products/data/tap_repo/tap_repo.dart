import 'package:dartz/dartz.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';

abstract class TapRepo {
  Future<Either<Failure, List<ProductModel>>> getproducts(
      {required String partId});
}
