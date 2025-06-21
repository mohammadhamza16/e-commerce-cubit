import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/validators.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';

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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix the errors in red')),
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
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.background,
                    AppColor.secondary.withAlpha(25),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.all(16.0.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: AppStyle.headline1.copyWith(fontSize: 28.sp),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Login to your account',
                            style: AppStyle.subtitle.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 40.h),
                          Form(
                            key: _formKey,
                            autovalidateMode:
                                _autoValidate
                                    ? AutovalidateMode.always
                                    : AutovalidateMode.disabled,
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  label: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: Validators.email,
                                ),
                                SizedBox(height: 24.h),
                                CustomTextFormField(
                                  label: 'Password',
                                  obscureText: _obscurePassword,
                                  controller: passwordController,
                                  validator: Validators.password,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: 32.h),
                                CustomButton(text: 'Login', onPressed: _submit),
                                SizedBox(height: 24.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: AppStyle.bodySecondary,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Sign up',
                                        style: AppStyle.button,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
