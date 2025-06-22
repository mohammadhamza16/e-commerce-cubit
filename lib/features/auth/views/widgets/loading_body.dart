import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Lottie.asset(AppAssets.loading, fit: BoxFit.cover),
      ),
    );
  }
}
