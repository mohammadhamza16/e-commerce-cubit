import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/core/helper/networking/dio/dio_helper.dart';
import 'package:e_commerce_app/core/helper/networking/dio/end_points.dart';
import 'package:e_commerce_app/features/show_products/model/category_model.dart';
import 'package:e_commerce_app/features/show_products/model/product_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;

  HomeRepo({required DioHelper dioHelper}) : _dioHelper = dioHelper;
  DioHelper get dioHelper => _dioHelper;

  Future<Either<String, List<ProductModel>>> fetchProducts() async {
    final result = await _dioHelper.get(
      endPoint: EndPoints.allProducts,
      headers: {'Content-Type': 'application/json'},
    );

    return result.fold((failure) => Left(failure), (response) {
      if (response.statusCode != 200) {
        return Left('Failed to fetch products');
      }
      final List<ProductModel> products =
          (response.data as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
      return Right(products);
    });
  }

  Future<Either<String, CategoryModel>> fetchCategory({
    required String categoryName,
  }) async {
    final result = await _dioHelper.get(
      endPoint: '${EndPoints.categories}/$categoryName',
      headers: {'Content-Type': 'application/json'},
    );

    return result.fold((failure) => Left(failure), (response) {
      if (response.statusCode != 200) {
        return Left('Failed to fetch category');
      }
      final CategoryModel category = CategoryModel.fromJson(response.data);
      return Right(category);
    });
  }

  Future<Either<String, List<CategoryModel>>> fetchCategories() async {
    final result = await _dioHelper.get(
      endPoint: EndPoints.categories,
      headers: {'Content-Type': 'application/json'},
    );
    return result.fold((failure) => Left(failure), (response) {
      if (response.statusCode != 200) {
        return Left('Failed to fetch categories');
      }
      final List<CategoryModel> categories =
          (response.data as List)
              .map((item) => CategoryModel.fromJson({'name': item}))
              .toList();
      return Right(categories);
    });
  }

  Future<Either<String, List<ProductModel>>> fetchProductsByCategory({
    required String categoryName,
  }) async {
    final result = await _dioHelper.get(
      endPoint: '${EndPoints.productsByCategory}/$categoryName',
      headers: {'Content-Type': 'application/json'},
    );

    return result.fold((failure) => Left(failure), (response) {
      if (response.statusCode != 200) {
        return Left('Failed to fetch products for category');
      }
      final List<ProductModel> products =
          (response.data as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
      return Right(products);
    });
  }
}
