import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_assets.dart';

class ProductsShimmer extends StatelessWidget {
  final int itemCount;
  const ProductsShimmer({this.itemCount = 6, super.key});

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
          (context, index) => Shimmer.fromColors(
            baseColor: AppColor.primary.withValues(alpha: 0.08),
            highlightColor: AppColor.primary.withValues(alpha: 0.18),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primary.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: AppColor.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.r),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        AppAssets.product,
                        width: 60.w,
                        height: 60.h,
                        color: Colors.white.withValues(alpha: 0.2),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: AppColor.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          width: 80.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: AppColor.primary.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                color: AppColor.primary.withValues(alpha: 0.13),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              width: 24.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                color: AppColor.primary.withValues(alpha: 0.13),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          childCount: itemCount,
        ),
      ),
    );
  }
}
