import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/features/show_products/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> _views = [
    const ProductsView(),
    Center(child: Text('Cart', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
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
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedFontSize: 14.sp,
          unselectedFontSize: 12.sp,
          iconSize: 24.sp,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: AppColor.textSecondary,
          onTap: _changeIndex,
          currentIndex: _selectedIndex,

          selectedLabelStyle: AppStyle.body.copyWith(
            fontWeight: FontWeight.bold,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              activeIcon: Icon(Icons.home_outlined),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              activeIcon: Icon(Icons.shopping_cart_outlined),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              activeIcon: Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
    );
  }
}
