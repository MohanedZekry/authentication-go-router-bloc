import 'package:dio/dio.dart';
import 'package:go_router_authentication/infrastructure/network/base_http_client.dart';
import '../../core/utils/constants.dart';

class HttpClientImpl implements BaseHttpClient {
  late Dio dio;

  HttpClientImpl({
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, dynamic>? headers,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.BASE_URL,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: headers ?? {'Content-Type': 'application/json'},
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer your_access_token';
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            String newAccessToken = await refreshToken();
            setAuthToken(newAccessToken);
            return handler.resolve(await dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
  }

  @override
  Future<Response> post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? query}) async {
    return await dio.post(
      path,
      data: data,
      queryParameters: query,
    );
  }

  @override
  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    return await dio.get(
      path,
      queryParameters: query,
    );
  }

  @override
  Future<Response> delete(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? query}) async {
    return await dio.delete(
      path,
      queryParameters: query,
      data: data,
    );
  }

  @override
  Future<Response> put(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? query}) async {
    return await dio.put(
      path,
      data: data,
      queryParameters: query,
    );
  }

  @override
  void setAuthToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  Future<String> refreshToken() async {
    return 'your_new_access_token';
  }

}