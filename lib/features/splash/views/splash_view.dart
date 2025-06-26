import 'package:e_commerce_app/core/helper/router/routes.dart';
import 'package:e_commerce_app/core/helper/service_locator.dart';
import 'package:e_commerce_app/core/helper/storage/secure_storage.dart';
import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  double _scale = 0.85;
  Offset _bgOffset = const Offset(0, 0.12);
  Offset _textOffset = const Offset(0, 0.25);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _opacity = 1;
          _scale = 1;
          _bgOffset = Offset.zero;
          _textOffset = Offset.zero;
        });
      }
    });
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await getIt<SecureTokenStorage>().getToken();
    if (!mounted) return;
    if (token != null && token.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSlide(
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOut,
            offset: _bgOffset,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 900),
              opacity: _opacity,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 900),
                scale: _scale,
                child: Image.asset(
                  AppAssets.splashBackground,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(color: AppColor.primary.withValues(alpha: 0.85)),
          Center(
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOut,
              offset: _textOffset,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 900),
                opacity: _opacity,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 900),
                  scale: _scale,
                  child: Text(
                    'Baya3 Store',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
