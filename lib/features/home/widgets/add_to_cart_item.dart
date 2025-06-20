import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:flutter/material.dart';

class AddToCartIcon extends StatelessWidget {
  const AddToCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColor.lightBlue, blurRadius: 4)],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Icon(Icons.add_shopping_cart, color: AppColor.secondary, size: 20),
    );
  }
}
