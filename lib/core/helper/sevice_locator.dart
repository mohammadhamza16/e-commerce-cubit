import 'package:e_commerce_app/core/helper/networking/dio/dio_helper.dart';
import 'package:e_commerce_app/core/helper/storage/secure_storage.dart';
import 'package:e_commerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(dioHelper: getIt<DioHelper>()),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
  getIt.registerLazySingleton<SecureTokenStorage>(() => SecureTokenStorage());
}
