import 'package:e_commerce_app/features/show_products/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PorudctsGridView extends StatelessWidget {
  const PorudctsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8.0.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0.w,
          mainAxisSpacing: 8.0.h,
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
