import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helper/service_locator.dart';

import 'package:e_commerce_app/features/cart/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/models/cart_product_model.dart';
import 'package:e_commerce_app/features/cart/models/cart_product_with_details.dart';
import 'package:e_commerce_app/features/cart/viewmodels/repo/cart_repo.dart';
import 'package:e_commerce_app/features/show_products/models/product_model.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

// bug from backend
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartRepo get cartRepo => getIt<CartRepo>();
  HomeRepo get homeRepo => getIt<HomeRepo>();

  List<ProductModel> _allProducts = [];

  Future<void> fetchUserCart() async {
    emit(CartLoading());
    final productsResult = await homeRepo.fetchProducts();
    productsResult.fold((_) {}, (products) => _allProducts = products);
    final result = await cartRepo.getUserCart();
    result.fold((failure) => emit(CartError(failure)), (cart) {
      final details =
          cart.products.map((cartProduct) {
            final product = _allProducts.firstWhere(
              (p) => p.id == cartProduct.productId,
              orElse: () => ProductModel(id: cartProduct.productId),
            );
            return CartProductWithDetails(
              product: product,
              quantity: cartProduct.quantity ?? 1,
            );
          }).toList();
      emit(CartLoaded(cart, details));
    });
  }

  Future<void> updateCart({
    required ProductModel productModel,
    required int quantity,
  }) async {
    emit(AddingToCartLoading());
    final result = await cartRepo.addToCart(
      date: DateTime.now().toIso8601String(),
      productModel: productModel,
      quantity: quantity,
    );
    result.fold((failure) => emit(AddingToCartError(failure)), (cart) {
      final details = [
        CartProductWithDetails(product: productModel, quantity: quantity),
      ];
      emit(AddingToCartSuccess(cart, details));
    });
  }

  Future<void> increaseQuantity(ProductModel productModel) async {
    if (state is CartLoaded) {
      final loaded = state as CartLoaded;
      final updated =
          loaded.cartProductsWithDetails.map((item) {
            if (item.product.id == productModel.id) {
              return CartProductWithDetails(
                product: item.product,
                quantity: item.quantity + 1,
              );
            }
            return item;
          }).toList();
      await _syncCartWithBackend(updated);
    }
  }

  Future<void> decreaseQuantity(ProductModel productModel) async {
    if (state is CartLoaded) {
      final loaded = state as CartLoaded;
      final updated =
          loaded.cartProductsWithDetails.map((item) {
            if (item.product.id == productModel.id && item.quantity > 1) {
              return CartProductWithDetails(
                product: item.product,
                quantity: item.quantity - 1,
              );
            }
            return item;
          }).toList();
      await _syncCartWithBackend(updated);
    }
  }

  Future<void> removeFromCart(ProductModel productModel) async {
    if (state is CartLoaded) {
      final loaded = state as CartLoaded;
      final updated =
          loaded.cartProductsWithDetails
              .where((item) => item.product.id != productModel.id)
              .toList();
      await _syncCartWithBackend(updated);
    }
  }

  Future<void> _syncCartWithBackend(
    List<CartProductWithDetails> updated,
  ) async {
    emit(CartLoading());
    final products =
        updated
            .map(
              (e) => CartProductModel(
                productId: e.product.id,
                quantity: e.quantity,
              ),
            )
            .toList();
    final result = await cartRepo.updateWholeCart(
      date: DateTime.now().toIso8601String(),
      products: products,
    );
    result.fold((failure) => emit(CartError(failure)), (cart) {
      final details =
          cart.products.map((cartProduct) {
            final product = _allProducts.firstWhere(
              (p) => p.id == cartProduct.productId,
              orElse: () => ProductModel(id: cartProduct.productId),
            );
            return CartProductWithDetails(
              product: product,
              quantity: cartProduct.quantity ?? 1,
            );
          }).toList();
      emit(CartLoaded(cart, details));
    });
  }
}
