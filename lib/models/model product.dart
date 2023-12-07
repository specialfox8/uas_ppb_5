import 'package:uuid/uuid.dart';

class Product {
  final String id;
  final String nama;
  final int harga;
  final String deskripsi;
  final String imagePath;
  dynamic sugarOption;
  dynamic iceOption;
  dynamic sizeOption;
  String category;
  int quantity;

  Product({
    String? id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.imagePath,
    required this.category,
    this.sugarOption = '',
    this.iceOption = '',
    this.sizeOption = '',
    this.quantity = 0,
    
  }) : id = id ?? generateUniqueId();
  
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
  } // Menggunakan generateUniqueId() jika ID tidak disediakan
}

String generateUniqueId() {
  var uuid = Uuid();
  return uuid.v4();
}


