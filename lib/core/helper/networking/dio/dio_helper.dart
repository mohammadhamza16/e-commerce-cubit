import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'dio_errors.dart';

class DioHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://yourapi.com/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  static Future<Either<String, Response>> post({
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
