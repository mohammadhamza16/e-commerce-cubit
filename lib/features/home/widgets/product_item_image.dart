import 'package:e_commerce_app/features/home/widgets/add_to_cart_item.dart';
import 'package:flutter/material.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/product.png', fit: BoxFit.cover),
        ),
        Positioned(top: 8, right: 8, child: AddToCartIcon()),
      ],
    );
  }
}
