import 'package:e_commerce_app/core/helper/router/routes.dart';
import 'package:e_commerce_app/core/helper/service_locator.dart';
import 'package:e_commerce_app/core/helper/storage/secure_storage.dart';
import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/widgets/custom_button.dart';

class CustomLogout extends StatelessWidget {
  const CustomLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () async {
        final shouldLogout = await showDialog<bool>(
          context: context,
          barrierDismissible: true,
          builder:
              (context) => AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.error.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        AppAssets.warning,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Logout ?',
                      style: AppStyle.headline2.copyWith(
                        color: AppColor.error,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Are you sure you want to logout from your account? ',
                      style: AppStyle.body.copyWith(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        isGreadiant: false,
                        text: 'Logout',
                        color: AppColor.error,
                        textColor: Colors.white,
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        isGreadiant: false,
                        text: 'Cancel',
                        color: Colors.white,
                        textColor: AppColor.info,
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ],
                  ),
                ],
              ),
        );
        if (shouldLogout == true) {
          await getIt<SecureTokenStorage>().deleteToken();
          if (context.mounted) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.loginView, (route) => false);
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.error.withValues(alpha: 0.15)),
          boxShadow: [
            BoxShadow(
              color: AppColor.error.withValues(alpha: 0.04),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.logout, color: AppColor.error, size: 20),
            SizedBox(width: 6),
            Text(
              'Logout',
              style: AppStyle.body.copyWith(
                color: AppColor.error,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
