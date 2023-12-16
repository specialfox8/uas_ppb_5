import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas_ppb_5/models/product.dart';

class HistoryScreen extends StatelessWidget {
  final List<Product> cartProducts;
  final String comment;
  final int totalRounded;

  const HistoryScreen({
    Key? key,
    required this.cartProducts,
    required this.comment,
    required this.totalRounded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8), 
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var product in cartProducts)
                      ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '${product.nama} x${product.quantity}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text('Harga: Rp. ${NumberFormat.decimalPattern().format(product.harga)}'),
                          ),
                          Text('Total: Rp. ${NumberFormat.decimalPattern().format(product.harga * product.quantity)}'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (comment.isNotEmpty)
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text('Comment'),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(comment),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        Text(
                          '${NumberFormat.decimalPattern().format(totalRounded)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
