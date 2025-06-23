import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/core/helper/sevice_locator.dart';
import 'package:e_commerce_app/core/helper/storage/secure_storage.dart';
import 'package:e_commerce_app/core/widgets/loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/core/helper/router/routes.dart';
import 'package:e_commerce_app/features/auth/views/widgets/login_initial_body.dart';

import 'package:e_commerce_app/features/auth/views/widgets/animtaed_snak_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    getIt<SecureTokenStorage>().getToken().then((token) {
      if (token != null && token.isNotEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    });
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  void _submit() {
    setState(() {
      _autoValidate = true;
    });
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<AuthCubit>(
        context,
        listen: false,
      ).login(usernameController.text, passwordController.text);
    } else {
      showAnimatedSnackBar(
        type: AnimatedSnackBarType.error,
        duration: const Duration(seconds: 2),
        context: context,
        message: 'Please fix the errors in red',
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showAnimatedSnackBar(
              message: state.message,
              context: context,
              type: AnimatedSnackBarType.error,
            );
          } else if (state is AuthSuccess) {
            showAnimatedSnackBar(
              message: 'Login Success',
              context: context,
              type: AnimatedSnackBarType.success,
            );
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
        },
        builder: (context, state) {
          Widget body;
          if (state is AuthLoading) {
            body = const LoadingBody();
          } else {
            body = LoginInitialBody(
              usernameController: usernameController,
              passwordController: passwordController,
              formKey: _formKey,
              autoValidate: _autoValidate,
              obscurePassword: _obscurePassword,
              onTogglePassword:
                  () => setState(() => _obscurePassword = !_obscurePassword),
              onSubmit: _submit,
            );
          }
          return Scaffold(body: body);
        },
      ),
    );
  }
}
