// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key, required this.icon, this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.black.withValues(alpha: 0.1),
            width: 1.w,
          ),
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: AppColor.black, size: 16.sp),
      ),
    );
  }
}
