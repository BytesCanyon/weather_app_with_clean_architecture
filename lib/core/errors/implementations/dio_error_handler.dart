import 'package:dio/dio.dart';
import '../interfaces/ierrorhandler.dart';
import '../../exceptions/implementations/exceptions_base.dart';

class DioErrorHandler implements IErrorHandler<DioException> {
  @override
  void handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        throw ConnectionException("Connection error");
      case DioExceptionType.connectionTimeout:
        throw TimeoutException("Connection timeout");
      case DioExceptionType.receiveTimeout:
        throw TimeoutException("Receive timeout");
      case DioExceptionType.sendTimeout:
        throw TimeoutException("Send timeout");
      case DioExceptionType.badResponse:
        _handleBadResponse(e.response);
        break;
      case DioExceptionType.cancel:
        throw UnknownException("Request canceled");
      case DioExceptionType.unknown:
        throw UnknownException("Unknown error");
      case DioExceptionType.badCertificate:
        throw UnknownException(
            "Connection issue: We couldn’t verify the server’s security certificate.");
      default:
        throw UnknownException("Unhandled error type");
    }
  }

  void _handleBadResponse(Response? response) {
    if (response == null) {
      throw UnknownException("Bad response: No response received.");
    }

    switch (response.statusCode) {
      case 401:
        throw UnauthorizedException("Unauthorized: ${response.statusCode}");
      case 403:
        throw ForbiddenException("Forbidden: ${response.statusCode}");
      case 404:
        throw NotFoundException("Not Found: ${response.statusCode}");
      case 409:
        throw ConflictException("Conflict: ${response.statusCode}");
      case 500:
        throw ServerErrorException("Server error: ${response.statusCode}");
      default:
        throw UnknownException("Unhandled error: ${response.statusCode}");
    }
  }
}
