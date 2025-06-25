import 'package:e_commerce_app/core/helper/networking/dio/dio_helper.dart';
import 'package:e_commerce_app/core/helper/storage/secure_storage.dart';

import 'package:e_commerce_app/features/auth/viewmodels/repo/auth_repo.dart';
import 'package:e_commerce_app/features/auth/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/cubit/category_cubit/category_cubit.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/cubit/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/repo/home_repo.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(dioHelper: getIt<DioHelper>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(dioHelper: getIt<DioHelper>()),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerFactory<CategoryCubit>(
    () => CategoryCubit(homeRepo: getIt<HomeRepo>()),
  );

  getIt.registerLazySingleton<SecureTokenStorage>(() => SecureTokenStorage());
}
