import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:e_commerce_app/features/show_products/cubit/category/category_cubit.dart';
import 'package:e_commerce_app/features/show_products/cubit/category/category_state.dart';
import 'package:e_commerce_app/features/show_products/widgets/categories_loaded_view.dart';
import 'package:e_commerce_app/features/show_products/widgets/centered_loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/features/show_products/widgets/products_loaded_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../cubit/products/products_cubit.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryCubit>().fetchCategories();
      context.read<ProductsCubit>().fetchProducts();
    });
  }

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

            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategorySuccess) {
                  final List<String> categoryNames =
                      state.categories.map((c) => c.name).toList();
                  return CategoriesLoadedView(categories: categoryNames);
                } else if (state is CategoryError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: \\${state.message}')),
                  );
                } else if (state is CategoryInitial) {
                  return CenteredLoadingAnimation(
                    animationPath: AppAssets.imageLoading,
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Container(color: Colors.red, height: 100.h),
                  );
                }
              },
            ),

            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return ProductsLoadedView(products: state.products);
                } else if (state is ProductsError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: \\${state.message}')),
                  );
                } else if (state is ProductsInitial) {
                  return CenteredLoadingAnimation(
                    height: 250.h,
                    width: 250.w,
                    animationPath: AppAssets.productsLoading,
                  );
                } else {
                  return SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
