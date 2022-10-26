// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

/// {@template product}
/// A class that represents a product.
/// {@endtemplate}
class Product {
  /// {@macro product}
  Product({
    required this.available,
    required this.name,
    this.picture,
    required this.price,
    this.id,
  });

  /// Returns a new [Product] with the given [Map<String, dynamic>].
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      available: json['available'] as bool,
      name: json['name'] as String,
      picture: json['picture'] as String?,
      price: (json['price'] as num).toDouble(),
    );
  }

  ///
  factory Product.fromJson(String str) {
    return Product.fromMap(json.decode(str) as Map<String, dynamic>);
  }

  ///
  String toJson() => json.encode(toMap());

  /// converts a Json into a map
  Map<String, dynamic> toMap() => {
        'available': available,
        'name': name,
        'picture': picture,
        'price': price,
      };

  /// Availability of the product.
  final bool available;

  /// Name of the product.
  final String name;

  /// Picture of the product.
  final String? picture;

  /// Price of the product.
  final num price;

  /// ID of the product.
  String? id;
}
