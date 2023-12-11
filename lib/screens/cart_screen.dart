import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_ppb_5/providers/product_provider.dart';
import 'package:uas_ppb_5/models/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:intl/intl.dart';
import 'package:uas_ppb_5/screens/history_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String comment = '';

  @override
  Widget build(BuildContext context) {
    var cartProducts = Provider.of<ProductProvider>(context).cartProducts;

    double taxRate = 0.10;

    int total = cartProducts.fold(0, (sum, product) {
      int quantity = Provider.of<ProductProvider>(context).getQuantity(product.id);
      return sum + (product.harga * quantity);
    });

    double taxAmount = total * taxRate;

    double totalWithTax = total + taxAmount;

    int totalRounded = totalWithTax.round();

    String orderId = generateOrderId();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order ID',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Date',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(orderId, style: GoogleFonts.poppins()),
                          Text(getCurrentDate(), style: GoogleFonts.poppins()),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const DottedLine(
                        lineLength: double.infinity,
                        dashLength: 5.0,
                        dashColor: Color.fromARGB(255, 45, 45, 45),
                      ),
                      const SizedBox(height: 12),
                      // Item Produk
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          var product = cartProducts[index];
                          return Column(
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '# ${product.nama}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(NumberFormat.decimalPattern().format(product.harga)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    _buildQuantityControls(context, product),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Add a comment (optional)',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              comment = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      const DottedLine(
                        lineLength: double.infinity,
                        dashLength: 5.0,
                        dashColor: Color.fromARGB(255, 45, 45, 45),
                      ),
                      const SizedBox(height: 12),
                      // Bagian Total
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Total',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120.0,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Rp. ${NumberFormat.decimalPattern().format(total)}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Pajak',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '11%',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Subtotal',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120.0,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Rp. ${NumberFormat.decimalPattern().format(totalRounded)}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24,),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                _showConfirmationDialog(context, cartProducts, totalRounded, comment);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color.fromARGB(255, 22, 22, 22), backgroundColor: const Color.fromRGBO(167, 211, 151, 1.000),
                              ),
                              child: const Text('Checkout'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Tombol "View History" di luar card
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Kirim data ke halaman berikutnya
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HistoryScreen(
                              cartProducts: cartProducts,
                              comment: comment,
                              totalRounded: totalRounded,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(167, 211, 151, 1.000),
                        onPrimary: const Color.fromARGB(255, 22, 22, 22),
                      ),
                      child: const Text('View History'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityControls(BuildContext context, Product product) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            Provider.of<ProductProvider>(context, listen: false)
                .decrementQuantity(product.id);
          },
        ),
        Text(
          product.quantity.toString(),
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Provider.of<ProductProvider>(context, listen: false)
                .incrementQuantity(product.id);
          },
        ),
      ],
    );
  }

  String generateOrderId() {
    DateTime now = DateTime.now();
    String orderId = 'GLK-${now.hour}${now.minute}${now.second}';
    return orderId;
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    return formattedDate;
  }

  void _showConfirmationDialog(
    BuildContext context,
    List<Product> cartProducts,
    int totalRounded,
    String comment,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Confirmation'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var product in cartProducts)
                ListTile(
                  title: Text('${product.nama} x${product.quantity}'),
                  subtitle: Text('Rp. ${NumberFormat.decimalPattern().format(product.harga * product.quantity)}'),
                ),
              const SizedBox(height: 16),

              // Menampilkan komentar jika ada
              if (comment.isNotEmpty)
                ListTile(
                  title: const Text('Comment'),
                  subtitle: Text(comment),
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  Text('Rp. ${NumberFormat.decimalPattern().format(totalRounded)}'),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                // Kirim data ke halaman berikutnya
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HistoryScreen(
                      cartProducts: cartProducts,
                      comment: comment,
                      totalRounded: totalRounded,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(167, 211, 151, 1.000)),
                foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 22, 22, 22)),
              ),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
