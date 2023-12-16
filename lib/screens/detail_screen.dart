// detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_ppb_5/models/product.dart';
import 'package:uas_ppb_5/providers/product_provider.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({Key? key, required this.product}) : super(key: key);
  @override
  State<DetailScreen> createState() => _DetailScreenState();

}
class _DetailScreenState extends State<DetailScreen> {
  int quantity = 0;
  String selectedSugarOption = '';
  String selectedIceOption = '';
  String selectedSizeOption = '';

  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // icon back ditambahkan agar jika tidak ingin "add to cart" maka bisa back ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 200.0,
                  child: Image.asset(
                    widget.product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Rp. ${NumberFormat.decimalPattern().format(widget.product.harga)}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        widget.product.deskripsi,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false).addToCart(product);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added to cart'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context, quantity);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(167, 211, 151, 1.000)),
                      foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 22, 22, 22)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}