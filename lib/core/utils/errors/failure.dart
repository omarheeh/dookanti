abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class FireBaseFailure extends Failure {
  FireBaseFailure(super.errMessage);
}
