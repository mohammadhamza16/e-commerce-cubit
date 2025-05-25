import 'package:e_commerce_app/features/auth/views/login_view.dart';
import 'package:e_commerce_app/features/auth/views/regestier_view.dart';
import 'package:e_commerce_app/features/home/views/home_view.dart';
import 'package:e_commerce_app/router/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AppRoutes.loginView:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case AppRoutes.registerView:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    default:
      return MaterialPageRoute(builder: (context) => (const HomeView()));
  }
}
