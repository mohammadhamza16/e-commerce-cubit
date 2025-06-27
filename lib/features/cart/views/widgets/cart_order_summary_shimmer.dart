import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartOrderSummaryShimmer extends StatelessWidget {
  const CartOrderSummaryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 120, height: 18, color: Colors.white),
            const SizedBox(height: 8),
            ...List.generate(
              2,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 80, height: 16, color: Colors.white),
                    Container(width: 40, height: 16, color: Colors.white),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey.shade200, thickness: 1, height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 60, height: 18, color: Colors.white),
                Container(width: 60, height: 20, color: Colors.white),
              ],
            ),
            const SizedBox(height: 12),
            Container(width: double.infinity, height: 40, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
