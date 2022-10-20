// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

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
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      available: json['available'] as bool,
      name: json['name'] as String,
      picture: json['picture'] as String?,
      price: (json['price'] as num).toDouble(),
    );
  }

  /// Availability of the product.
  final bool available;

  /// Name of the product.
  final String name;

  /// Picture of the product.
  final String? picture;

  /// Price of the product.
  final num price;
}
