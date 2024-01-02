import 'package:dartz/dartz.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/utils/errors/failure.dart';
import 'package:dookanti/feuters/products/data/cart_repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final FireStoreServise fireStoreServise;
  CartRepoImpl(this.fireStoreServise);
  @override
  Future<Either<Failure, String>> addOrder(
      {required Map<String, dynamic> body}) async {
    try {
      await fireStoreServise.add(body: body);
      return right('Sucsess');
    } catch (e) {
      return left(FireBaseFailure('error in send order'));
    }
  }
}
