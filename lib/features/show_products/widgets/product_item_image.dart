import 'package:e_commerce_app/features/show_products/widgets/add_to_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/product.png', fit: BoxFit.cover),
        ),
        Positioned(top: 8.h, right: 8.w, child: AddToCartIcon()),
      ],
    );
  }
}
