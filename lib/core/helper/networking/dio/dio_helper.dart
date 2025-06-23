import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/helper/networking/dio/dio_errors.dart';
import 'package:e_commerce_app/core/helper/networking/dio/end_points.dart';

class DioHelper {
  final Dio _dio;

  DioHelper()
    : _dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          headers: {'Content-Type': 'application/json'}, // ثابتة هنا
        ),
      );

  Future<Either<String, Response>> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
        options: Options(headers: headers),
      );
      return Right(response);
    } catch (error) {
      return Left(DioErrors.getErrorMessage(error));
    }
  }
}
