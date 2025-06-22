import 'package:e_commerce_app/core/helper/router/on_generate_routes.dart';
import 'package:e_commerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/utils/sevice_locator.dart';
import 'package:e_commerce_app/features/auth/views/regestier_view.dart';
import 'package:e_commerce_app/features/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return BlocProvider(
          create: (context) => AuthCubit(getIt()),

          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-Commerce App',
            onGenerateRoute: generateRoute,

            home: child,
          ),
        );
      },
      child: const RegisterView(),
    );
  }
}
