import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/helper/networking/dio/dio_helper.dart';
import 'package:e_commerce_app/core/helper/networking/dio/end_points.dart';
import 'package:e_commerce_app/features/auth/model/auth_response_model.dart';

class AuthRepo {
  final DioHelper _dioHelper;

  AuthRepo({required DioHelper dioHelper}) : _dioHelper = dioHelper;
  DioHelper get dioHelper => _dioHelper;

  Future<Either<String, AuthResponseModel>> login({
    required String email,
    required String password,
  }) async {
    final result = await _dioHelper.post(
      endPoint: EndPoints.login,
      headers: {'Content-Type': 'application/json'},
      data: {'username': email, 'password': password},
    );

    return result.fold((failure) => Left(failure), (response) {
      final model = AuthResponseModel.fromJson(response.data);
      return Right(model);
    });
  }

  Future<Either<String, AuthResponseModel>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final result = await _dioHelper.post(
      endPoint: EndPoints.register,
      data: {'username': username, 'email': email, 'password': password},
    );

    return result.fold((failure) => Left(failure), (response) {
      final model = AuthResponseModel.fromJson(response.data);
      return Right(model);
    });
  }
}
