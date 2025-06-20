import 'package:e_commerce_app/core/styles/app_style.dart';

import 'package:e_commerce_app/features/home/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Discover', style: AppStyle.headline1),
              ),
            ),
            PorudctsGridView(),
          ],
        ),
      ),
    );
  }
}
