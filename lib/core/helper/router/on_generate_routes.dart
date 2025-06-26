import 'package:e_commerce_app/core/helper/router/routes.dart';

import 'package:e_commerce_app/core/helper/service_locator.dart';
import 'package:e_commerce_app/features/auth/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/views/login_view.dart';
import 'package:e_commerce_app/features/auth/views/register_view.dart';
import 'package:e_commerce_app/features/cart/views/cart_view.dart';
import 'package:e_commerce_app/features/home/views/home_view.dart';

import 'package:e_commerce_app/features/productdetails/views/product_details_view.dart';
import 'package:e_commerce_app/features/profile/views/profile_view.dart';
import 'package:e_commerce_app/features/show_products/views/products_view.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/address/views/address_view.dart';
import 'package:e_commerce_app/features/splash/views/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  PageTransitionType transitionType = PageTransitionType.sharedAxisVertical;
  switch (settings.name) {
    case AppRoutes.home:
      builder = (context) => const HomeView();
      break;
    case AppRoutes.loginView:
      builder =
          (context) => BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginView(),
          );
      break;
    case AppRoutes.registerView:
      builder =
          (context) => BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const RegisterView(),
          );
      break;
    case AppRoutes.productsView:
      builder = (context) => const ProductsView();
      break;
    case AppRoutes.productDetailsView:
      builder = (context) => const ProductDetailsView();
      break;
    case AppRoutes.cartView:
      builder = (context) => const CartView();
      break;
    case AppRoutes.profileView:
      builder = (context) => const ProfileView();
      break;
    case AppRoutes.addressView:
      builder = (context) => const AddressView();
      break;
    case AppRoutes.splash:
      builder = (context) => const SplashView();
      break;
    default:
      builder = (context) => const HomeView();
  }
  return PageTransition(
    child: Builder(builder: builder),
    type: transitionType,
    settings: settings,
    duration: const Duration(milliseconds: 350),
    reverseDuration: const Duration(milliseconds: 350),
  );
}
