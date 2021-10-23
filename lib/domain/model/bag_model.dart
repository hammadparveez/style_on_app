import 'dart:convert';

import 'package:flutter/foundation.dart';

class BagModel {
  String productThumbnail;
  String productTitle;
  List<dynamic> option;
  double productPrice;
  BagModel({
    required this.productThumbnail,
    required this.productTitle,
    required this.option,
    required this.productPrice,
  });

  BagModel copyWith({
    String? productThumbnail,
    String? productTitle,
    List<dynamic>? option,
    double? productPrice,
  }) {
    return BagModel(
      productThumbnail: productThumbnail ?? this.productThumbnail,
      productTitle: productTitle ?? this.productTitle,
      option: option ?? this.option,
      productPrice: productPrice ?? this.productPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productThumbnail': productThumbnail,
      'productTitle': productTitle,
      'option': option,
      'productPrice': productPrice,
    };
  }

  factory BagModel.fromMap(Map<String, dynamic> map) {
    return BagModel(
      productThumbnail: map['productThumbnail'],
      productTitle: map['productTitle'],
      option: List<dynamic>.from(map['option']),
      productPrice: map['productPrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BagModel.fromJson(String source) => BagModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BagModel(productThumbnail: $productThumbnail, productTitle: $productTitle, option: $option, productPrice: $productPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BagModel &&
      other.productThumbnail == productThumbnail &&
      other.productTitle == productTitle &&
      listEquals(other.option, option) &&
      other.productPrice == productPrice;
  }

  @override
  int get hashCode {
    return productThumbnail.hashCode ^
      productTitle.hashCode ^
      option.hashCode ^
      productPrice.hashCode;
  }
}
