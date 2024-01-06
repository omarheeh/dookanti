import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dookanti/core/utils/errors/failure.dart';

abstract class CategoryRepo {
  Future<Either<Failure, String>> addCategory(
      {required String name,
      required List<String> partsList,
      required Uint8List file});
}
