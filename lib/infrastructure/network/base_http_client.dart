import 'package:dio/dio.dart';

abstract class BaseHttpClient {
  Future<Response> post(String path, {Map<String, dynamic>? data, Map<String, dynamic>? query});
  Future<Response> get(String path, {Map<String, dynamic>? query});
  Future<Response> delete(String path, {Map<String, dynamic>? data, Map<String, dynamic>? query});
  Future<Response> put(String path, {Map<String, dynamic>? data, Map<String, dynamic>? query});
  void setAuthToken(String token);
  Future<String> refreshToken();
}