import 'package:dio/dio.dart';

class DioErrors {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout. Please try again.';
        case DioExceptionType.sendTimeout:
          return 'Send timeout. Please try again.';
        case DioExceptionType.receiveTimeout:
          return 'Receive timeout. Please try again.';
        case DioExceptionType.badCertificate:
          return 'Bad certificate.';
        case DioExceptionType.badResponse:
          return 'Server error: ${error.response?.statusCode ?? ''}';
        case DioExceptionType.cancel:
          return 'Request was cancelled.';
        case DioExceptionType.connectionError:
          return 'Connection error. Please check your internet.';

        default:
          return 'Unexpected error occurred.';
      }
    } else {
      return 'Unexpected error occurred.';
    }
  }
}
