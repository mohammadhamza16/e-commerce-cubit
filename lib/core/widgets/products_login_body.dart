import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginLoadingBody extends StatelessWidget {
  const LoginLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        height: 350,
        child: Lottie.asset(AppAssets.productsLoading, fit: BoxFit.cover),
      ),
    );
  }
}
