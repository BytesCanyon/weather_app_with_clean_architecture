import '../interfaces/i_api_get.dart';

class ApiConsumer {
  final IApiGet _iApiGet;

  ApiConsumer(this._iApiGet);

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _iApiGet.get(path, queryParameters: queryParameters);
    return response;
  }
}
