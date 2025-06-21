import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/core/validators.dart';
import 'package:e_commerce_app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                            'Create Account',
                            style: AppStyle.headline1.copyWith(fontSize: 28.sp),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Sign up to get started',
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
                                  label: 'Full Name',
                                  hint: 'Enter your full name',
                                  controller: fullNameController,
                                  keyboardType: TextInputType.text,
                                  validator: Validators.fullName,
                                ),
                                SizedBox(height: 24.h),
                                CustomTextFormField(
                                  label: 'Email',
                                  hint: 'Enter your email address',
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: Validators.email,
                                ),
                                SizedBox(height: 24.h),
                                CustomTextFormField(
                                  label: 'Password',
                                  hint: 'Enter your password',
                                  controller: passwordController,
                                  obscureText: _obscurePassword,
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
                                  validator: Validators.password,
                                ),
                                SizedBox(height: 24.h),
                                CustomTextFormField(
                                  label: 'Confirm Password',
                                  hint: 'Re-enter your password',
                                  controller: confirmPasswordController,
                                  obscureText: _obscurePassword,
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
                                  validator:
                                      (value) =>
                                          value != passwordController.text
                                              ? 'Passwords do not match'
                                              : null,
                                ),
                                SizedBox(height: 32.h),
                                SizedBox(
                                  width: double.infinity,
                                  child: CustomButton(
                                    text: 'Register',
                                    onPressed: _submit,
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account? ',
                                      style: AppStyle.bodySecondary,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.loginView,
                                        );
                                      },
                                      child: Text(
                                        'Login',
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
