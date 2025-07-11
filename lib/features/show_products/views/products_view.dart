import 'package:e_commerce_app/features/show_products/viewmodels/cubit/category_cubit/category_cubit.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/cubit/category_cubit/category_state.dart';
import 'package:e_commerce_app/features/show_products/views/widgets/categories_loaded_view.dart';
import 'package:e_commerce_app/features/show_products/views/widgets/categories_shimmer.dart';

import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/features/show_products/views/widgets/products_loaded_view.dart';
import 'package:e_commerce_app/features/show_products/views/widgets/products_shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodels/cubit/products_cubit/products_cubit.dart';

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
                  return CategoriesShimmer(itemCount: 5);
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
                  return ProductsShimmer();
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
