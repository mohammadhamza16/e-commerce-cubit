import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:flutter/material.dart';

class CustomLogout extends StatelessWidget {
  const CustomLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          SizedBox(width: 30),
          Icon(Icons.logout, color: AppColor.error, size: 24),
          SizedBox(width: 10),
          Text(
            'Logout',
            style: AppStyle.label14600.copyWith(color: AppColor.error),
          ),
        ],
      ),
    );
  }
}
