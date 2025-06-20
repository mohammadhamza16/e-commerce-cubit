import 'package:e_commerce_app/core/styles/app_color.dart';
import 'package:e_commerce_app/core/styles/app_style.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/product.png', fit: BoxFit.cover),
                    SizedBox(height: 16.0),
                    Text('Product Name', style: AppStyle.headline1),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Text('Product Rating ', style: AppStyle.rating),

                        SizedBox(width: 8.0),
                        Text('4.5', style: AppStyle.ratingValue),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Product description goes here. It provides details about the product features and specifications.',
                      style: AppStyle.body,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Price', style: AppStyle.productPriceLabel),
                    SizedBox(height: 4.0),
                    Text('\$99.99', style: AppStyle.productPrice),
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
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
