import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/features/cart/views/widgets/custom_cart_button.dart';
import 'package:e_commerce_app/features/show_products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final ProductModel productModel;
  final int quantity;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onRemove;
  const CartItem({
    super.key,
    required this.productModel,
    required this.quantity,
    this.onIncrease,
    this.onDecrease,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.0.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          productModel.image != null
              ? Image.network(
                productModel.image!,
                width: 60.w,
                height: 60.h,
                fit: BoxFit.contain,
              )
              : Image.asset(AppAssets.product, width: 60.w, height: 60.h),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.0.h),
                Text(
                  (productModel.title ?? '').length > 10
                      ? '${productModel.title!.substring(0, 10)}...'
                      : productModel.title ?? '',
                  style: AppStyle.productTitleMedium,
                ),
                SizedBox(height: 30.0.h),
                Text(
                  '\$${(productModel.price ?? 0) * quantity}',
                  style: AppStyle.productPrice.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: onRemove,
                child: Image.asset(AppAssets.trash, width: 18.w, height: 24.h),
              ),
              SizedBox(height: 40.0.h),
              Row(
                children: [
                  CustomCartButton(icon: Icons.remove, onTap: onDecrease),
                  SizedBox(width: 8.0.w),
                  Text(quantity.toString()),
                  SizedBox(width: 8.0.w),
                  CustomCartButton(icon: Icons.add, onTap: onIncrease),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
