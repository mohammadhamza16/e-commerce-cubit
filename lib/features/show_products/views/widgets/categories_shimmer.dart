import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';

class CategoriesShimmer extends StatelessWidget {
  final int itemCount;
  const CategoriesShimmer({this.itemCount = 8, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 48.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          itemCount: itemCount,
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
          itemBuilder:
              (context, index) => Shimmer.fromColors(
                baseColor: AppColor.primary.withValues(alpha: 0.08),
                highlightColor: AppColor.primary.withValues(alpha: 0.18),
                child: Container(
                  width: 90.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.primary.withValues(alpha: 0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
