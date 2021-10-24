import 'dart:convert';

import 'package:flutter/foundation.dart';

class BagModel {
  String productThumbnail;
  String productTitle;
  List<dynamic> option;
  double productPrice;
  int qty = 1;
  BagModel({
    required this.productThumbnail,
    required this.productTitle,
    required this.option,
    required this.productPrice,
    this.qty = 1,
  });
 

  BagModel copyWith({
    String? productThumbnail,
    String? productTitle,
    List<dynamic>? option,
    double? productPrice,
    int? qty,
  }) {
    return BagModel(
      productThumbnail: productThumbnail ?? this.productThumbnail,
      productTitle: productTitle ?? this.productTitle,
      option: option ?? this.option,
      productPrice: productPrice ?? this.productPrice,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productThumbnail': productThumbnail,
      'productTitle': productTitle,
      'option': option,
      'productPrice': productPrice,
      'qty': qty,
    };
  }

  factory BagModel.fromMap(Map<String, dynamic> map) {
    return BagModel(
      productThumbnail: map['productThumbnail'],
      productTitle: map['productTitle'],
      option: List<dynamic>.from(map['option']),
      productPrice: map['productPrice'],
      qty: map['qty'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BagModel.fromJson(String source) => BagModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BagModel(productThumbnail: $productThumbnail, productTitle: $productTitle, option: $option, productPrice: $productPrice, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BagModel &&
      other.productThumbnail == productThumbnail &&
      other.productTitle == productTitle &&
      listEquals(other.option, option) &&
      other.productPrice == productPrice &&
      other.qty == qty;
  }

  @override
  int get hashCode {
    return productThumbnail.hashCode ^
      productTitle.hashCode ^
      option.hashCode ^
      productPrice.hashCode ^
      qty.hashCode;
  }
}
