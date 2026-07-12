import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  const ServerException(this.message);

  @override
  String toString() => message;
}

String resolveDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return 'Connection timed out. Please try again.';
    case DioExceptionType.connectionError:
      return 'Please check your internet connection.';
    case DioExceptionType.badResponse:
      return 'Server error occurred (${error.response?.statusCode ?? ''}).';
    case DioExceptionType.cancel:
      return 'Request was cancelled.';
    default:
      return 'An unexpected error occurred. Please try again.';
  }
}
