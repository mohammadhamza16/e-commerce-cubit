part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartModel cart;
  final List<CartProductWithDetails> cartProductsWithDetails;
  const CartLoaded(this.cart, this.cartProductsWithDetails);
  @override
  List<Object?> get props => [cart, cartProductsWithDetails];
}

class CartError extends CartState {
  final String message;
  const CartError(this.message);
  @override
  List<Object?> get props => [message];
}

class AddingToCartLoading extends CartState {}

class AddingToCartSuccess extends CartState {
  final CartModel cart;
  final List<CartProductWithDetails> cartProductsWithDetails;
  const AddingToCartSuccess(this.cart, this.cartProductsWithDetails);
  @override
  List<Object?> get props => [cart, cartProductsWithDetails];
}

class AddingToCartError extends CartState {
  final String message;
  const AddingToCartError(this.message);
  @override
  List<Object?> get props => [message];
}
