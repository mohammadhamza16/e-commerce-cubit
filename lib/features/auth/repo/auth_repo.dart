import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/helper/networking/dio/dio_helper.dart';
import 'package:e_commerce_app/core/helper/networking/dio/end_points.dart';
import 'package:e_commerce_app/features/auth/model/auth_response_model.dart';

class AuthRepo {
  Future<Either<String, AuthResponseModel>> login({
    required String email,
    required String password,
  }) async {
    final result = await DioHelper.post(
      endPoint: EndPoints.login,
      data: {'email': email, 'password': password},
    );

    return result.fold((failure) => Left(failure), (response) {
      final model = AuthResponseModel.fromJson(response.data);
      return Right(model);
    });
  }

  Future<Either<String, AuthResponseModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await DioHelper.post(
      endPoint: EndPoints.register,
      data: {'name': name, 'email': email, 'password': password},
    );

    return result.fold((failure) => Left(failure), (response) {
      final model = AuthResponseModel.fromJson(response.data);
      return Right(model);
    });
  }
}
