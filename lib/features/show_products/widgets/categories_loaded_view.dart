import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../cubit/products/products_cubit.dart';
import 'package:e_commerce_app/core/styles/app_assets.dart';

class CategoriesLoadedView extends StatefulWidget {
  const CategoriesLoadedView({super.key, required this.categories});
  final List<String> categories;

  @override
  State<CategoriesLoadedView> createState() => _CategoriesLoadedViewState();
}

class _CategoriesLoadedViewState extends State<CategoriesLoadedView>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['all', ...widget.categories];
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0.h),
        height: 48.h,
        child: Stack(
          children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: ChoiceChip(
                      label: Text(
                        categories[index],
                        style: AppStyle.headline2.copyWith(
                          color:
                              selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                      selected: selectedIndex == index,
                      selectedColor: AppColor.primary,
                      backgroundColor: AppColor.white,
                      elevation: 2,
                      onSelected: (selected) async {
                        setState(() {
                          selectedIndex = index;
                          isLoading = true;
                        });
                        if (categories[index] == 'all') {
                          await context.read<ProductsCubit>().fetchProducts();
                        } else {
                          await context
                              .read<ProductsCubit>()
                              .fetchProductsByCategory(
                                categoryName: categories[index],
                              );
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                  ),
            ),
            if (isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.white.withValues(alpha: 0.7),
                  child: Center(
                    child: Lottie.asset(
                      AppAssets.imageLoading,
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
