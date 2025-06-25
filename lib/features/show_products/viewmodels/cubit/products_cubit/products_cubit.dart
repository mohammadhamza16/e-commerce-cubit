import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/show_products/models/product_model.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/repo/home_repo.dart';

import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required HomeRepo homeRepo})
    : _homeRepo = homeRepo,
      super(ProductsInitial());
  final HomeRepo _homeRepo;
  Future<Either<String, List<ProductModel>>> fetchProducts() async {
    emit(ProductsInitial());
    try {
      final Either<String, List<ProductModel>> result =
          await _homeRepo.fetchProducts();
      return result.fold(
        (failure) {
          emit(ProductsError(failure));
          return Left(failure);
        },
        (products) {
          emit(ProductsSuccess(products));
          return Right(products);
        },
      );
    } catch (e) {
      final errorMsg = e.toString();
      emit(ProductsError(errorMsg));
      return Left(errorMsg);
    }
  }

  Future<Either<String, List<ProductModel>>> fetchProductsByCategory({
    required String categoryName,
  }) async {
    emit(ProductsInitial());
    try {
      final Either<String, List<ProductModel>> result = await _homeRepo
          .fetchProductsByCategory(categoryName: categoryName);
      return result.fold(
        (failure) {
          emit(ProductsError(failure));
          return Left(failure);
        },
        (products) {
          emit(ProductsSuccess(products));
          return Right(products);
        },
      );
    } catch (e) {
      final errorMsg = e.toString();
      emit(ProductsError(errorMsg));
      return Left(errorMsg);
    }
  }
}
