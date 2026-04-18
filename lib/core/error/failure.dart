//* Failure Core
abstract class Failure {
  final String message;
  final int? statusCode;

  Failure(this.message, {this.statusCode});
}

// --------------------- Types ------------------------------ //
class ServerFailure extends Failure {
  ServerFailure(super.message, {super.statusCode});
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message, {super.statusCode});
}

class UnKnownFailure extends Failure {
  UnKnownFailure(super.message, {super.statusCode});
}
