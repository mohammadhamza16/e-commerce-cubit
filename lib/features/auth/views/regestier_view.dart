import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/features/auth/views/widgets/animtaed_snak_bar.dart';
import 'package:e_commerce_app/core/widgets/loading_body.dart';
import 'package:e_commerce_app/features/auth/views/widgets/regestier_intial_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/helper/router/routes.dart';
import 'package:e_commerce_app/features/auth/cubit/auth_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  void _submit() {
    setState(() => _autoValidate = true);
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<AuthCubit>(context, listen: false).register(
        usernameController.text,
        emailController.text,
        passwordController.text,
      );
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
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showAnimatedSnackBar(
              context: context,
              message: state.message,
              type: AnimatedSnackBarType.error,
            );
          } else if (state is AuthSuccess) {
            showAnimatedSnackBar(
              context: context,
              message: state.message,
              type: AnimatedSnackBarType.success,
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          Widget body;
          if (state is AuthLoading) {
            body = const LoadingBody();
          } else {
            body = RegisterInitialBody(
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
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
