import 'package:e_commerce_app/features/cart/views/widgets/cart_item.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartProducts = [
      {'name': 'Product 1', 'price': 120.0},
      {'name': 'Product 2', 'price': 80.0},
      {'name': 'Product 3', 'price': 50.0},
    ];
    final double totalPrice = cartProducts.fold(
      0,
      (sum, item) => sum + (item['price'] as double),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
            onPressed:
                () => Navigator.of(context).pushReplacementNamed('/home'),
          ),
          title: Row(
            children: [
              Icon(
                Icons.shopping_cart,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Cart',
                style: AppStyle.headline1.copyWith(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
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
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 8),
                  itemBuilder: (context, index) => const CartItem(),
                  separatorBuilder:
                      (context, index) =>
                          Divider(color: Colors.grey.shade200, thickness: 1),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: AppStyle.headline2.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    ...cartProducts.map(
                      (product) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product['name'],
                              style: AppStyle.productTitleSmall,
                            ),
                            Text(
                              '\$${product['price']}',
                              style: AppStyle.productPrice.copyWith(
                                fontSize: 15,
                              ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: AppStyle.headline2.copyWith(fontSize: 18),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: AppStyle.productPrice.copyWith(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
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
          ),
        ),
      ),
    );
  }
}
