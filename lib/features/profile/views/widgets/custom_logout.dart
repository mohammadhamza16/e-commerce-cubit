import 'package:e_commerce_app/core/helper/router/routes.dart';
import 'package:e_commerce_app/core/helper/service_locator.dart';
import 'package:e_commerce_app/core/helper/storage/secure_storage.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:flutter/material.dart';

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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Row(
                  children: [
                    Icon(Icons.logout, color: AppColor.error, size: 22),
                    SizedBox(width: 6),
                    Text(
                      'Logout',
                      style: AppStyle.headline2.copyWith(
                        color: AppColor.error,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'Are you sure you want to logout?',
                  style: AppStyle.body,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.error,
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Logout'),
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
