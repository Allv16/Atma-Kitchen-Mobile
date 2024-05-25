import 'package:atma_kitchen/core/constants.dart';
import 'package:dio/dio.dart';

class HTTPService {
  final _dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ))
    ..interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

  Future<dynamic> get(String path, {String? token = ''}) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (e) {
      return e.response?.data;
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> data,
      {String? token = ''}) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      return e.response?.data;
    }
  }

  Future<dynamic> delete(String path, {String? token = ''}) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.delete(path);
      return response.data;
    } on DioException catch (e) {
      return e.response?.data;
    }
  }
}
