import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/cubit/category_cubit/category_state.dart';
import 'package:e_commerce_app/features/show_products/models/category_model.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/repo/home_repo.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required HomeRepo homeRepo})
    : _homeRepo = homeRepo,
      super(CategoryInitial());
  final HomeRepo _homeRepo;
  Future<Either<String, List<CategoryModel>>> fetchCategories() async {
    emit(CategoryInitial());
    try {
      final result = await _homeRepo.fetchCategories();
      return result.fold(
        (failure) {
          emit(CategoryError(failure));
          return Left(failure);
        },
        (categories) {
          emit(CategorySuccess(categories));
          return Right(categories);
        },
      );
    } catch (e) {
      final errorMsg = e.toString();
      emit(CategoryError(errorMsg));
      return Left(errorMsg);
    }
  }
}
