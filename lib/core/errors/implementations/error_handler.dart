import '../interfaces/ierrorhandler.dart';

class ErrorHandler<T> {
  final IErrorHandler<T> _iErrorHandler;

  ErrorHandler({required IErrorHandler<T> iErrorHandler})
      : _iErrorHandler = iErrorHandler;

  void handleError(T e) {
    _iErrorHandler.handleError(e);
  }
}
