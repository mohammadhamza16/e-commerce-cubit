import 'package:e_commerce_app/features/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return CartItem();
          },
          itemCount: 10, // Example item count
        ),
      ),
    );
  }
}
