import 'package:e_commerce_app/features/home/widgets/product_item.dart';
import 'package:flutter/material.dart';

class PorudctsGridView extends StatelessWidget {
  const PorudctsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.65,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => ProductItem(),
          childCount: 10,
        ),
      ),
    );
  }
}
