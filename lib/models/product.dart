import 'package:uuid/uuid.dart';
class Product {
  final String id;
  final String nama;
  final int harga;
  final String deskripsi;
  final String imagePath;
   String category;
   int quantity;

  // Konstruktor untuk membuat produk baru dengan ID unik
  Product({
    String? id, 
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.imagePath,
    required this.category,
    this.quantity = 0,
  }) : id = id ?? generateUniqueId();

  // Metode pembuat salinan objek dengan pembaruan opsional
  Product copyWith({
    String? id,
    String? nama,
    int? harga,
    String? deskripsi,
    String? imagePath,
    String? category,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      harga: harga ?? this.harga,
      deskripsi: deskripsi ?? this.deskripsi,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
    );
  }

  // Metode pembuat produk baru dengan ID unik
  static Product createNew({
    required String nama,
    required int harga,
    required String deskripsi,
    required String imagePath,
    required String category,
  }) {
    return Product(
      id: generateUniqueId(),
      nama: nama,
      harga: harga,
      deskripsi: deskripsi,
      imagePath: imagePath,
      category: category,
    );
  }
}


String generateUniqueId() {
  var uuid = Uuid();
  return uuid.v4();
}

