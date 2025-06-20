import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/features/show_products/widgets/products_grid_view.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  final List<String> categories = const [
    'T-Shirts',
    'Jeans',
    'Shoes',
    'Accessories',
    'Bags',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: CustomScrollView(
          slivers: [
            // Discover Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Discover', style: AppStyle.headline1),
              ),
            ),

            // Horizontal Chips (Categories)
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  itemBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text(
                            categories[index],
                            style: AppStyle.headline2,
                          ),
                          backgroundColor: Colors.white,
                          elevation: 2,
                        ),
                      ),
                ),
              ),
            ),

            // Grid of products
            PorudctsGridView(),
          ],
        ),
      ),
    );
  }
}
