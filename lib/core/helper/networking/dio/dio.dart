import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/helper/networking/dio/end_points.dart';
import 'dio_errors.dart';

class DioService {
  final Dio _dio;

  DioService({String? baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          responseType: ResponseType.json,
        ),
      );

  Future<Response?> get({
    required String endPoints,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Function(String)? onError,
  }) async {
    try {
      return await _dio.get(
        endPoints,
        queryParameters: query,
        options: Options(headers: headers),
      );
    } catch (error) {
      if (onError != null) onError(DioErrors.getErrorMessage(error));
      return null;
    }
  }

  Future<Response?> post({
    required String endPoints,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Function(String)? onError,
  }) async {
    try {
      return await _dio.post(
        endPoints,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
    } catch (error) {
      if (onError != null) onError(DioErrors.getErrorMessage(error));
      return null;
    }
  }
}
