import 'package:dartz/dartz.dart';
import 'package:dookanti/core/utils/errors/failure.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addOrder(
      {required Map<String, dynamic> body});
}
