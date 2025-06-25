import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:e_commerce_app/features/show_products/views/widgets/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => Lottie.asset(AppAssets.imageLoading),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Positioned(top: 8.h, right: 8.w, child: AddToCartIcon()),
      ],
    );
  }
}
