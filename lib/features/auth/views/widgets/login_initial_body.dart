import 'package:e_commerce_app/core/helper/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/core/validators.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';

class LoginInitialBody extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final bool autoValidate;
  final bool obscurePassword;
  final VoidCallback onTogglePassword;
  final VoidCallback onSubmit;

  const LoginInitialBody({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.formKey,
    required this.autoValidate,
    required this.obscurePassword,
    required this.onTogglePassword,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.background, AppColor.secondary.withAlpha(25)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
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
                    key: formKey,
                    autovalidateMode:
                        autoValidate
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label: 'Username',
                          controller: usernameController,
                          validator: Validators.username,
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          label: 'Password',
                          controller: passwordController,
                          obscureText: obscurePassword,
                          validator: Validators.password,
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: onTogglePassword,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        CustomButton(text: 'Login', onPressed: onSubmit),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: AppStyle.bodySecondary,
                            ),
                            TextButton(
                              onPressed:
                                  () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.registerView,
                                  ),
                              child: Text('Sign up', style: AppStyle.button),
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
  }
}
