import 'package:e_commerce_app/core/helper/router/routes.dart';
import 'package:e_commerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/utils/sevice_locator.dart';
import 'package:e_commerce_app/features/auth/views/login_view.dart';
import 'package:e_commerce_app/features/auth/views/regestier_view.dart';
import 'package:e_commerce_app/features/cart/views/cart_view.dart';
import 'package:e_commerce_app/features/home/views/home_view.dart';
import 'package:e_commerce_app/features/productdetails/views/product_details_view.dart';
import 'package:e_commerce_app/features/profile/views/profile_view.dart';
import 'package:e_commerce_app/features/show_products/views/products_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AppRoutes.loginView:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider<AuthCubit>(
              create: (context) => getIt<AuthCubit>(),
              child: const LoginView(),
            ),
      );
    case AppRoutes.registerView:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider<AuthCubit>(
              create: (context) => getIt<AuthCubit>(),
              child: const RegisterView(),
            ),
      );
    case AppRoutes.productsView:
      return MaterialPageRoute(builder: (context) => const ProductsView());
    case AppRoutes.productDetailsView:
      return MaterialPageRoute(
        builder: (context) => const ProductDetailsView(),
      );
    case AppRoutes.cartView:
      return MaterialPageRoute(builder: (context) => const CartView());
    case AppRoutes.profileView:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    default:
      return MaterialPageRoute(builder: (context) => (const HomeView()));
  }
}
