import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/helper/networking/dio/end_points.dart';
import 'dio_errors.dart';

class DioHelper {
  Dio get _dio => Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
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
