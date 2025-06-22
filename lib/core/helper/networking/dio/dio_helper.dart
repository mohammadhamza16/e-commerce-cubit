import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/helper/networking/dio/dio_constants.dart';
import 'package:e_commerce_app/core/helper/networking/dio/dio_errors.dart';

class DioHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: DioConstants.baseUrl,
      connectTimeout: Duration(milliseconds: DioConstants.connectTimeout),
      receiveTimeout: Duration(milliseconds: DioConstants.receiveTimeout),
      responseType: ResponseType.json,
    ),
  );

  static Future<Response?> get(
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

  static Future<Response?> post(
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
