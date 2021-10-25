import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';

class BagModel {
  String cartId;
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
  }) : cartId = const Uuid().v4().toString();

  BagModel copyWith({
    BigInt? cartId,
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
    )..cartId = this.cartId;
  }

  Map<String, dynamic> toMap() {
    return {
      'cartId': cartId,
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
    )..cartId = map['cartId'];
  }

  String toJson() => json.encode(toMap());

  factory BagModel.fromJson(String source) =>
      BagModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BagModel(cartId: $cartId, productThumbnail: $productThumbnail, productTitle: $productTitle, option: $option, productPrice: $productPrice, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BagModel &&
        other.cartId == cartId &&
        other.productThumbnail == productThumbnail &&
        other.productTitle == productTitle &&
        listEquals(other.option, option) &&
        other.productPrice == productPrice &&
        other.qty == qty;
  }

  @override
  int get hashCode {
    return cartId.hashCode ^
        productThumbnail.hashCode ^
        productTitle.hashCode ^
        option.hashCode ^
        productPrice.hashCode ^
        qty.hashCode;
  }
}
