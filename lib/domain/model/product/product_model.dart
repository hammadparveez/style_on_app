import 'dart:convert';

import 'package:collection/collection.dart';

class ProductModel {
  final String id, title, desc, brand, sellerName, category, price, quantity;
  String? discountPrice;
  ProductOptionsModel? options;
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
      options: json['options'] != null
          ? ProductOptionsModel.fromMap(json['options'])
          : null,
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

class ProductOptionsModel {
  List<dynamic>? size;
  List<dynamic>? color;
  List<dynamic>? wieght;
  ProductOptionsModel({
    this.size,
    this.color,
    this.wieght,
  });

  ProductOptionsModel copyWith({
    List<dynamic>? size,
    List<dynamic>? color,
    List<dynamic>? wieght,
  }) {
    return ProductOptionsModel(
      size: size ?? this.size,
      color: color ?? this.color,
      wieght: wieght ?? this.wieght,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Size': size,
      'color': color,
      'wieght': wieght,
    };
  }

  factory ProductOptionsModel.fromMap(Map<String, dynamic> map) {
    return ProductOptionsModel(
      size: map['Size'] != null ? List<dynamic>.from(map['Size']) : null,
      color: map['color'] != null ? List<dynamic>.from(map['color']) : null,
      wieght: map['wieght'] != null ? List<dynamic>.from(map['wieght']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  ///Takes a JSON format String and covert it into an Object [json.decode]
  factory ProductOptionsModel.fromJson(String source) =>
      ProductOptionsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductOptionsModel(Size: $size, color: $color, wieght: $wieght)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ProductOptionsModel &&
        listEquals(other.size, size) &&
        listEquals(other.color, color) &&
        listEquals(other.wieght, wieght);
  }

  @override
  int get hashCode => size.hashCode ^ color.hashCode ^ wieght.hashCode;
}
