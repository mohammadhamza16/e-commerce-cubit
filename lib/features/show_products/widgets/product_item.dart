import 'package:e_commerce_app/core/helper/router/routes.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/features/show_products/widgets/product_item_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetailsView);
      },
      child: Card(
        elevation: 6.r,
        shadowColor: AppColor.black,
        color: AppColor.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ProductItemImage()),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.w,
                vertical: 8.0.h,
              ),
              child: Text(
                'Product Name',
                style: AppStyle.productTitleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.w,
                vertical: 4.0.h,
              ),
              child: Text(
                '\$9.99',
                style: AppStyle.productPrice.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
