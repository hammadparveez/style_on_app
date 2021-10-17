import 'dart:convert';

class ProductModel {
  final String id, title, desc, brand, sellerName, category, price, quantity;
  String? discountPrice;
  List<Map<String, dynamic>>? options;
  List<dynamic>? imagesLinks;
  int rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.desc,
      required this.brand,
      required this.sellerName,
      required this.category,
      required this.price,
      required this.quantity,
      this.rating = 0,
      this.imagesLinks,
      this.discountPrice,
      this.options});

  factory ProductModel.toJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['productID'],
      title: json['title'],
      desc: json['description'],
      brand: json['brand'],
      sellerName: json['seller'],
      category: json['category'],
      price: json['price'],
      quantity: json['quantity'],
      discountPrice: json['discountPrice'],
      options: json['options'],
      imagesLinks: jsonDecode(json['images']),
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productID': id,
      'title': title,
      'description': desc,
      'brand': brand,
      'images': imagesLinks,
      'options': options,
      'seller': sellerName,
      'price': rating,
      'discountPrice': discountPrice,
      'category': category,
    };
  }
}
