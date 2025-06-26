import 'package:e_commerce_app/core/helper/service_locator.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/features/cart/views/cart_view.dart';
import 'package:e_commerce_app/features/profile/views/profile_view.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/cubit/category_cubit/category_cubit.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/cubit/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/features/show_products/viewmodels/repo/home_repo.dart';

import 'package:e_commerce_app/features/show_products/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> _views = [
    MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (context) => getIt<CategoryCubit>(),
        ),
        BlocProvider<ProductsCubit>(
          create: (context) => ProductsCubit(homeRepo: getIt<HomeRepo>()),
        ),
      ],
      child: ProductsView(),
    ),
    const CartView(),
    const ProfileView(),
  ];
  int _selectedIndex = 0;
  _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
      // Update the views based on the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _views[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          type: BottomNavigationBarType.fixed,

          selectedFontSize: 14.sp,
          unselectedFontSize: 12.sp,
          selectedItemColor: AppColor.primary,

          iconSize: 24.sp,
          onTap: _changeIndex,
          currentIndex: _selectedIndex,

          selectedLabelStyle: AppStyle.body.copyWith(
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home.png',
                width: 24.w,
                height: 24.h,
                color: _selectedIndex == 0 ? AppColor.primary : Colors.grey,
              ),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/cart.png',
                color: _selectedIndex == 1 ? AppColor.primary : Colors.grey,
                width: 24.w,
                height: 24.h,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                color: _selectedIndex == 2 ? AppColor.primary : Colors.grey,
                'assets/icons/profile.png',
                width: 24.w,
                height: 24.h,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
