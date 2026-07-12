import 'package:dio/dio.dart';
import 'package:men_store_app/core/network/api_endpoints.dart';

class DummyDioClient {
  DummyDioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.dummyBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: const {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  static final DummyDioClient _instance = DummyDioClient._internal();

  factory DummyDioClient() => _instance;

  late final Dio _dio;

  Dio get dio => _dio;
}
