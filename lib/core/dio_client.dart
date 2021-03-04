import 'package:dio/dio.dart';

class RestClient {
  final String _endPoint;
  Dio _dio;

  RestClient(this._endPoint) {
    var options = BaseOptions(
        baseUrl: _endPoint, connectTimeout: 10000, receiveTimeout: 30000);
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> get(String path, [Map<String, dynamic> data]) async {
    return _dio.get(path, queryParameters: data);
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, [Map<String, dynamic> data]) async {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path, [Map<String, dynamic> data]) async {
    return _dio.delete(path, data: data);
  }
}
