import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartIcon extends StatelessWidget {
  const AddToCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: AppColor.lightBlue, blurRadius: 4.r)],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Icon(
        Icons.add_shopping_cart,
        color: AppColor.secondary,
        size: 20.sp,
      ),
    );
  }
}
