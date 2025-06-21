import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:e_commerce_app/features/profile/widgets/custom_logout.dart';
import 'package:e_commerce_app/features/profile/widgets/profile_item.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Account'), centerTitle: true),
        body: Column(
          children: [
            ProfileItem(icon: AppAssets.orders, title: 'MY Orders'),
            Divider(thickness: 8),
            ProfileItem(icon: AppAssets.profileIcon, title: 'My Details'),
            Divider(),
            ProfileItem(icon: AppAssets.addressBook, title: 'Address Book'),
            Divider(),
            ProfileItem(icon: AppAssets.info, title: 'FAQs'),
            Divider(),
            ProfileItem(icon: AppAssets.helpCenter, title: 'Help Center'),
            Divider(thickness: 3),
            Spacer(flex: 2),
            CustomLogout(),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
