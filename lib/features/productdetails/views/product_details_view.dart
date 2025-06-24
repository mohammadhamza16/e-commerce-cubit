import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/styles/app_assets.dart';
import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/show_products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args == null || args is! ProductModel) {
      return Scaffold(
        appBar: AppBar(title: Text('Details')),
        body: Center(child: Text('No product data found.')),
      );
    }
    final product = args;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: AppStyle.headline1.copyWith(
            color: AppColor.black.withValues(alpha: 0.6),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: product.image ?? '',
                  fit: BoxFit.contain,
                  placeholder:
                      (context, url) =>
                          Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) =>
                          Image.asset(AppAssets.product, fit: BoxFit.contain),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title ?? '', style: AppStyle.headline1),
                    SizedBox(height: 16.0.h),
                    Row(
                      children: [
                        Text('Product Rating ', style: AppStyle.rating),
                        SizedBox(width: 8.0.w),
                        Text(
                          product.rating?.rate?.toStringAsFixed(1) ?? '-',
                          style: AppStyle.ratingValue,
                        ),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                    SizedBox(height: 16.0.h),
                    Text(product.description ?? '', style: AppStyle.body),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.0.h)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Price', style: AppStyle.label14600),
                      SizedBox(height: 4.0.h),
                      Text(
                        product.price != null
                            ? '\$${product.price!.toStringAsFixed(2)}'
                            : '-',
                        style: AppStyle.productPrice,
                      ),
                    ],
                  ),
                  CustomButton(
                    icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                    text: 'Add To Cart',
                    onPressed: () {},
                    width: MediaQuery.sizeOf(context).width * .6,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.0.h)),
          ],
        ),
      ),
    );
  }
}
