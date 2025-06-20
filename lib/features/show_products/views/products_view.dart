import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/features/show_products/widgets/products_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 16.0.h),
        child: CustomScrollView(
          slivers: [
            // Discover Title
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(18.0.w),
                child: Text('Discover', style: AppStyle.headline1),
              ),
            ),

            // Horizontal Chips (Categories)
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0.h),
                height: 48.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
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
