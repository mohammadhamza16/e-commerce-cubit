import 'package:e_commerce_app/features/cart/models/cart_product_model.dart';

class CartModel {
  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  final int? id;
  final int? userId;
  final DateTime? date;
  final List<CartProductModel> products;
  final int? v;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"],
      userId: json["userId"],
      date: DateTime.tryParse(json["date"] ?? ""),
      products:
          json["products"] == null
              ? []
              : List<CartProductModel>.from(
                json["products"]!.map((x) => CartProductModel.fromJson(x)),
              ),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "date": date?.toIso8601String(),
    "products": products.map((x) => x.toJson()).toList(),
    "__v": v,
  };
}
