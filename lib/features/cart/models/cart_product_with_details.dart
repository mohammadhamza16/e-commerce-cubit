import 'package:e_commerce_app/features/show_products/models/product_model.dart';

class CartProductWithDetails {
  final ProductModel product;
  final int quantity;
  CartProductWithDetails({required this.product, required this.quantity});
}
