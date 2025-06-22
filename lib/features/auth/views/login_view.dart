import 'package:e_commerce_app/features/auth/views/widgets/loading_body.dart';
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
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void _submit() {
    setState(() {
      _autoValidate = true;
    });
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().login(
        emailController.text,
        passwordController.text,
      );
    } else {
      showAnimatedSnackBar(
        context: context,
        message: 'Please fix the errors in red',
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showAnimatedSnackBar(message: state.message, context: context);
          } else if (state is AuthSuccess) {
            showAnimatedSnackBar(message: 'Login Success', context: context);
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
        },
        builder: (context, state) {
          Widget body;
          if (state is AuthLoading) {
            body = const LoadingBody();
          } else {
            body = LoginInitialBody(
              emailController: emailController,
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
