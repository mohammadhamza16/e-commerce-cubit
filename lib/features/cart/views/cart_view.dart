import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/features/cart/views/widgets/cart_item.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/cart/viewmodels/cubit/cart_cubit.dart';
import 'package:e_commerce_app/core/helper/service_locator.dart';
import 'package:e_commerce_app/features/cart/views/widgets/cart_shimmer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (_) => getIt<CartCubit>()..fetchUserCart(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.5,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.primary,
                    size: 28,
                  ),
                  onPressed:
                      () => Navigator.of(context).pushReplacementNamed('/home'),
                ),
                title: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: AppColor.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Cart',
                      style: AppStyle.headline1.copyWith(
                        fontSize: 22,
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return const CartShimmer();
                          } else if (state is CartLoaded) {
                            final cartProducts = state.cartProductsWithDetails;
                            final totalPrice = cartProducts.fold<double>(
                              0,
                              (sum, item) =>
                                  sum +
                                  (item.product.price ?? 0) * (item.quantity),
                            );
                            if (cartProducts.isEmpty) {
                              return Center(child: Text('Cart is empty'));
                            }
                            return Column(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    itemBuilder:
                                        (context, index) => CartItem(
                                          productModel:
                                              cartProducts[index].product,
                                          quantity:
                                              cartProducts[index].quantity,
                                          onIncrease:
                                              () => context
                                                  .read<CartCubit>()
                                                  .increaseQuantity(
                                                    cartProducts[index].product,
                                                  ),
                                          onDecrease:
                                              () => context
                                                  .read<CartCubit>()
                                                  .decreaseQuantity(
                                                    cartProducts[index].product,
                                                  ),
                                          onRemove:
                                              () => context
                                                  .read<CartCubit>()
                                                  .removeFromCart(
                                                    cartProducts[index].product,
                                                  ),
                                        ),
                                    separatorBuilder:
                                        (context, index) => Divider(
                                          color: Colors.grey.shade200,
                                          thickness: 1,
                                        ),
                                    itemCount: cartProducts.length,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order Summary',
                                        style: AppStyle.headline2.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ...cartProducts.map(
                                        (item) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  (item.product.title ?? '')
                                                              .length >
                                                          10
                                                      ? '${item.product.title!.substring(0, 10)}...'
                                                      : item.product.title ??
                                                          '',
                                                  style:
                                                      AppStyle
                                                          .productTitleSmall,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                '\$${((item.product.price ?? 0.0) * (item.quantity)).toStringAsFixed(2)}',
                                                style: AppStyle.productPrice
                                                    .copyWith(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey.shade200,
                                        thickness: 1,
                                        height: 24,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total:',
                                            style: AppStyle.headline2.copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            '\$${totalPrice.toStringAsFixed(2)}',
                                            style: AppStyle.productPrice
                                                .copyWith(
                                                  fontSize: 20,
                                                  color: AppColor.primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      CustomButton(
                                        text: 'Check Out',
                                        onPressed: () {},
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else if (state is CartError) {
                            return Center(child: Text(state.message));
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
