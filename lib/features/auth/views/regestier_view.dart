import 'package:e_commerce_app/features/auth/views/widgets/animtaed_snak_bar.dart';
import 'package:e_commerce_app/features/auth/views/widgets/loading_body.dart';
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
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  void _submit() {
    setState(() => _autoValidate = true);
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().register(
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

  void _togglePassword() =>
      setState(() => _obscurePassword = !_obscurePassword);

  @override
  void dispose() {
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
            showAnimatedSnackBar(context: context, message: state.message);
          } else if (state is AuthSuccess) {
            showAnimatedSnackBar(context: context, message: state.message);
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
        },
        builder: (context, state) {
          Widget body;
          if (state is AuthLoading) {
            body = const LoadingBody();
          } else {
            body = RegisterInitialBody(
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
