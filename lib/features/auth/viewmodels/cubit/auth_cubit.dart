import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/features/auth/models/auth_response_model.dart';
import 'package:e_commerce_app/features/auth/viewmodels/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  login(String username, String password) async {
    emit(AuthLoading());
    final Either<String, AuthResponseModel> result = await _authRepo.login(
      username: username,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthError(failure)),
      (response) => emit(AuthSuccess('Login successful')),
    );
  }

  register(String username, String email, String password) async {
    emit(AuthLoading());
    final Either<String, AuthResponseModel> result = await _authRepo.register(
      username: username,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthError(failure)),
      (response) => emit(AuthSuccess('Registration successful')),
    );
  }
}
