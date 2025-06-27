import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/styles/app_assets.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image_$imageUrl',
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder:
                  (context, url) => Lottie.asset(AppAssets.imageLoading),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
