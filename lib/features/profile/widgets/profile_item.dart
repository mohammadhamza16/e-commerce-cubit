import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.icon, required this.title});
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      leading: Image.asset(icon, width: 22.0, height: 22.0, fit: BoxFit.cover),
      title: Text(title, style: AppStyle.label14600),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColor.black,
        size: 16.0,
      ),
    );
  }
}
