import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/core/validators.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';

class RegisterInitialBody extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final bool autoValidate;
  final bool obscurePassword;
  final VoidCallback onTogglePassword;
  final VoidCallback onSubmit;

  const RegisterInitialBody({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.autoValidate,
    required this.obscurePassword,
    required this.onTogglePassword,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.background, AppColor.secondary.withAlpha(25)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
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
                      label: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
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
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
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
                    CustomButton(text: 'Register', onPressed: onSubmit),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: AppStyle.bodySecondary,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Login', style: AppStyle.button),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
