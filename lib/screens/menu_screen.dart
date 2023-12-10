// menu_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_ppb_5/providers/product_provider.dart';
import 'package:uas_ppb_5/screens/NavHome.dart';
import 'package:uas_ppb_5/screens/detail_screen.dart';
import 'package:uas_ppb_5/screens/historyscreen.dart';
import 'package:uas_ppb_5/screens/homescreen.dart';
import 'package:uas_ppb_5/screens/login_screen.dart';
import 'package:uas_ppb_5/screens/cart_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();

    // Set filter produk dengan kategori 'all' secara default
    Future.delayed(Duration.zero, () {
      Provider.of<ProductProvider>(context, listen: false)
          .filterProductsByCategory('all');
    });
  }

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).filteredProducts;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
          ),
        ],
        title: isSearching
            ? TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search Products',
                ),
              )
            : const Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Row(
                children: [
                  const Text(
                    'GlukGlek!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const ListTile(
              title: Text('Our Products'),
              leading: Icon(Icons.store_outlined),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const BarScreen(),
                  ),
                );
              },
            ),
            // ListTile(
            //   title: const Text('Voucher'),
            //   leading: const Icon(Icons.home),
            //   onTap: () {
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(
            //         builder: (context) => const VoucherScreen(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              title: const Text('History'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
            ),
            // ListTile(
            //   title: const Text('Profile'),
            //   leading: const Icon(Icons.home),
            //   onTap: () {
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(
            //         builder: (context) => const ProfileScreen(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout_outlined),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Our Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Tambahkan widget untuk menampilkan tombol kategori di sini
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .filterProductsByCategory('coffee');
                    },
                    child: Text('Coffee'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .filterProductsByCategory('non coffee');
                    },
                    child: Text('Non Coffee'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .filterProductsByCategory('all');
                    },
                    child: Text('All'),
                  ),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        // Navigate
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(product: products[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.3,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    child: Image.asset(
                                      products[index].imagePath,
                                      fit: BoxFit.cover,
                                      height: double
                                          .infinity, // Atur tinggi gambar menjadi infinity
                                      width: double.infinity,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                products[index].nama,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: products.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'My cart',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
