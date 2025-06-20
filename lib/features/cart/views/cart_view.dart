import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text('Your cart is empty')),
        ),
      ),
    );
  }
}
