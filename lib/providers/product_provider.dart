// product_provider.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {

  final List<Product> _products = [
    Product(
        nama: "Espresso Supreme",
        harga: 25000,
        deskripsi: "Espresso kelas atas dengan cita rasa yang kuat dan pekat, disajikan dalam gelas kecil untuk pengalaman kopi yang autentik.",
        imagePath: "assets/images/products/EspressoSupreme.png",
        category: "coffee",
      ),
    Product(
        nama: "Caramel Macchiato Bliss",
        harga: 30000,
        deskripsi:
            "Kopi espresso yang dipadukan dengan susu dan sirup karamel, memberikan rasa manis yang lezat dan aroma yang menggoda.",
        imagePath: "assets/images/products/CaramelMacchiato2.png",
        category: "coffee",
      ),
      Product(
        nama: "Mocha Madness",
        harga: 28000,
        deskripsi:
            "Kombinasi sempurna antara espresso, susu, dan cokelat. Menyajikan kelezatan cokelat dalam setiap tegukan.",
        imagePath: "assets/images/products/MochaMadness3.png",
        category: "coffee",
      ),
      Product(
        nama: "Cold Brew Harmony",
        harga: 35000,
        deskripsi:
            "Kopi dingin yang diseduh dengan sempurna, memberikan kelembutan rasa tanpa keasaman berlebih. Nikmati sensasi kepuasan di setiap tegukan.",
        imagePath: "assets/images/products/ColdBrew4.png",
        category: "coffee",
      ),
      Product(
        nama: "Matcha Latte",
        harga: 32000,
        deskripsi:
            "Latte lembut dengan sentuhan vanila yang memberikan pengalaman minum kopi yang menyenangkan dan menyegarkan.",
        imagePath: "assets/images/products/MachaLatte8.png",
        category: "coffee",
      ),
      Product(
        nama: "Red Velvet Latte",
        harga: 40000,
        deskripsi:
            "Kopi dari biji satu asal yang dipilih dengan cermat, menawarkan keunikan rasa khas dari wilayah kopi tertentu.",
        imagePath: "assets/images/products/RedVelvetLatte11.png",
        category: "coffee",
      ),
      Product(
        nama: "Hazelnut Heaven",
        harga: 33000,
        deskripsi:
            "Latte kaya rasa dengan sentuhan hazelnut yang memberikan nuansa kaya dan mendalam pada setiap tegukan.",
        imagePath: "assets/images/products/HazelnutLatte5.png",
        category: "coffee",
      ),
      Product(
        nama: "Strawberry Latte",
        harga: 26000,
        deskripsi:
            "Americano yang segar dan dingin, memberikan kejelasan rasa kopi dengan sensasi kesegaran yang membangkitkan semangat.",
        imagePath: "assets/images/products/StrawberryLatte7.png",
        category: "coffee",
      ),
      // non coffee
      Product(
        nama: "Cold Brew",
        harga: 22000,
        deskripsi:
            "Minuman matcha yang memberikan kesehatan dan ketenangan, dengan rasa yang kaya dan aromatik.",
        imagePath: "assets/images/products/ColdBrew4.png",
        category: "non coffee",
      ),
      Product(
        nama: "Berry Lemonade",
        harga: 26000,
        deskripsi:
            "Lemonade dengan tambahan beri segar, memberikan kombinasi manis dan asam yang menggugah selera.",
        imagePath: "assets/images/products/BerryLemonade9.png",
        category: "non coffee",
      ),
      Product(
        nama: "Mojito Lime",
        harga: 26000,
        deskripsi:
            "Minuman berkarbonasi dengan sentuhan mint dan citrus, memberikan sensasi kesegaran yang luar biasa.",
        imagePath: "assets/images/products/MojitoLIme10.png",
        category: "non coffee",
      ),
      Product(
        nama: "Raspberry Blackcurrent",
        harga: 15000,
        deskripsi:
            "Teh Olong dengan sentuhan wangi dan rasa teh original, memberikan sensasi kesegaran yang luar biasa.",
        imagePath: "assets/images/products/RaspberryBlackcurrant12.png",
        category: "non coffee",
      ),
  ];



  List<Product> get products => _products;
  final List<Product> _cartProducts = [];
  List<Product> get cartProducts => _cartProducts;
  List<Product> _filteredProducts = [];
  List<Product> get filteredProducts => _filteredProducts;

void filterProductsByCategory(String category) {
  if (category.toLowerCase() == 'all') {
    _filteredProducts = List.from(_products);
  } else {
    _filteredProducts = _products.where((product) => product.category == category).toList();
  }

  notifyListeners();
}

  int getQuantity(String productId) {
    return _cartProducts
        .where((cartProduct) => cartProduct.id == productId)
        .fold(0, (sum, cartProduct) => sum + cartProduct.quantity);
  }

void incrementQuantity(String productId) {
  int index = _cartProducts.indexWhere((cartProduct) => cartProduct.id == productId);

  if (index != -1) {
    _cartProducts[index].quantity++;
  }

  notifyListeners();
}

void decrementQuantity(String productId) {
  int index = _cartProducts.indexWhere((cartProduct) => cartProduct.id == productId);

  if (index != -1) {
    if (_cartProducts[index].quantity > 1) {
      _cartProducts[index].quantity--;
    } else {
      _cartProducts.removeAt(index);
    }
  }

  notifyListeners();
}

  void addToCart(Product product) {
  int index = _cartProducts.indexWhere((cartProduct) => cartProduct.id == product.id);

  if (index != -1) {
    _cartProducts.removeAt(index);
  }

  // Add the product back to the cart with quantity 1
  _cartProducts.add(product.copyWith(quantity: 1));

  notifyListeners();
  }
}