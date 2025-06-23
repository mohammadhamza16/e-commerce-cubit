import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesLoadedView extends StatelessWidget {
  const CategoriesLoadedView({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0.h),
        height: 48.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0.r),
                  ),

                  label: Text(categories[index], style: AppStyle.headline2),
                  backgroundColor: AppColor.white,
                  elevation: 2,
                ),
              ),
        ),
      ),
    );
  }
}
