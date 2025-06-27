import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/helper/networking/dio/dio_helper.dart';
import 'package:e_commerce_app/core/helper/networking/dio/end_points.dart';
import 'package:e_commerce_app/features/cart/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/models/cart_product_model.dart';
import 'package:e_commerce_app/features/show_products/models/product_model.dart';

// bug from backend
class CartRepo {
  final DioHelper _dioHelper;

  CartRepo({required DioHelper dioHelper}) : _dioHelper = dioHelper;
  DioHelper get dioHelper => _dioHelper;

  Future<Either<String, CartModel>> addToCart({
    required String date,
    required ProductModel productModel,
    required int quantity,
    int userId = 2,
  }) async {
    final result = await _dioHelper.post(
      endPoint: '/carts',
      data: {
        "userId": userId,
        "date": date,
        "products": [
          {"productId": productModel.id, "quantity": quantity},
        ],
      },
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(CartModel.fromJson(response.data)),
    );
  }

  Future<Either<String, CartModel>> getUserCart({int userId = 2}) async {
    final result = await _dioHelper.get(
      endPoint: EndPoints.getUserCart(userId),
    );
    return result.fold((failure) => Left(failure), (response) {
      final data = response.data;
      if (data is List && data.isNotEmpty) {
        return Right(CartModel.fromJson(data.last));
      } else if (data is Map<String, dynamic>) {
        return Right(CartModel.fromJson(data));
      } else {
        return Left('Unexpected cart data format');
      }
    });
  }

  Future<Either<String, CartModel>> updateWholeCart({
    required String date,
    required List<CartProductModel> products,
    int cartId = 2,
    int userId = 2,
  }) async {
    final result = await _dioHelper.put(
      endPoint: EndPoints.updateCart(cartId),
      data: {
        "userId": userId,
        "date": date,
        "products": products.map((e) => e.toJson()).toList(),
      },
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(CartModel.fromJson(response.data)),
    );
  }

  Future<Either<String, bool>> deleteCart({required int cartId}) async {
    try {
      final response = await _dioHelper.dio.delete(
        EndPoints.updateCart(cartId),
      );
      if (response.statusCode == 200) {
        return Right(true);
      } else {
        return Left('Failed to delete cart');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}
