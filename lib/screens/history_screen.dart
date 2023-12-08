import 'package:flutter/material.dart';
import 'package:uas_ppb_5/models/product.dart';

class HistoryScreen extends StatelessWidget {
  final List<Product> cartProducts;
  final String comment;
  final int totalRounded;

  const HistoryScreen({super.key, required this.cartProducts, required this.comment, required this.totalRounded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Screen'),
      ),
      body: Column(
        children: [
          for (var product in cartProducts)
            ListTile(
              title: Text('${product.nama} x${product.quantity}'),
              subtitle: Text('\Rp. ${product.harga * product.quantity}'),
            ),
          const SizedBox(height: 16),

          if (comment.isNotEmpty)
            ListTile(
              title: const Text('Comment'),
              subtitle: Text(comment),
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total'),
              Text('Rp. $totalRounded'),
            ],
          ),
        ],
      ),
    );
  }
}
