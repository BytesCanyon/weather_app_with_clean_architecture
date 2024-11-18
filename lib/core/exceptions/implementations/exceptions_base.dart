import '../interfaces/iexception_base.dart';

class ConnectionException extends IExceptionBase {
  ConnectionException(super.message);
}

class TimeoutException extends IExceptionBase {
  TimeoutException(super.message);
}

class UnauthorizedException extends IExceptionBase {
  UnauthorizedException(super.message) : super(statusCode: 401);
}

class ForbiddenException extends IExceptionBase {
  ForbiddenException(super.message) : super(statusCode: 403);
}

class NotFoundException extends IExceptionBase {
  NotFoundException(super.message) : super(statusCode: 404);
}

class ConflictException extends IExceptionBase {
  ConflictException(super.message) : super(statusCode: 409);
}

class ServerErrorException extends IExceptionBase {
  ServerErrorException(super.message) : super(statusCode: 500);
}

class UnknownException extends IExceptionBase {
  UnknownException(super.message);
}
