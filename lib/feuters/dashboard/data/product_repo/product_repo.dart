import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dookanti/core/utils/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, String>> addProduct({
    required String name,
    required String price,
    required String quantity,
    required Uint8List file,
    required String cId,
    required String cName,
    required String pId,
    required String pName,
  });
}
