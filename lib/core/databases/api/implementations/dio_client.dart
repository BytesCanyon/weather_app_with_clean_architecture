import 'package:dio/dio.dart';
import 'package:weather/core/errors/interfaces/ierrorhandler.dart';
import '../interfaces/i_api_get.dart';

class DioClient implements IApiGet {
  final Dio _dio;
  final IErrorHandler _iErrorHandler;

  DioClient({required Dio dio, required IErrorHandler iErrorHandler})
      : _dio = dio,
        _iErrorHandler = iErrorHandler;

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      _iErrorHandler.handleError(e);
    } catch (e) {
      rethrow;
    }
  }
}
