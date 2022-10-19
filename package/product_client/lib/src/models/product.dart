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
    return Product.fromMap(json.decode(str));
  }

  //ToDo: consultar naza

  // factory Product.fromJson(String str) {
  //   final decoded = json.decode(str) as Map<String, dynamic>;
  //   return Product.fromMap(decoded);
  // }

  /// Availability of the product.
  bool available;

  /// Name of the product.
  String name;

  /// Picture of the product.
  String? picture;

  /// Price of the product.
  num price;

  ///
  String toJson() => json.encode(toMap());

  ///
  Map<String, dynamic> toMap() => {
        'available': available,
        'name': name,
        'picture': picture,
        'price': price,
      };
}
