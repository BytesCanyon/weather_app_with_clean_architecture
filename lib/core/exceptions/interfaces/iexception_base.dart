abstract class IExceptionBase implements Exception {
  final String message;
  final int? statusCode;

  IExceptionBase(this.message, {this.statusCode});
}
