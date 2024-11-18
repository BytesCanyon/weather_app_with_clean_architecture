abstract class IApiGet {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
}
