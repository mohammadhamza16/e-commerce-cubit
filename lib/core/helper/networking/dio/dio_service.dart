import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/helper/networking/dio/end_points.dart';
import 'dio_errors.dart';
import 'dio_helper.dart';

class DioService extends DioHelper {
  final Dio _dio;

  DioService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          responseType: ResponseType.json,
        ),
      );

  Future<Response?> get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Function(String)? onError,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: query,
        options: Options(headers: headers),
      );
    } catch (error) {
      if (onError != null) onError(DioErrors.getErrorMessage(error));
      return null;
    }
  }

  Future<Response?> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Function(String)? onError,
  }) async {
    try {
      return await _dio.post(
        url,
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
