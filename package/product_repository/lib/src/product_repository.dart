import 'package:product_client/product_client.dart';

/// {@template product_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ProductRepository {
  /// {@macro product_repository}
  const ProductRepository(
    ProductClient client,
  ) : _client = client;

  /// The client used to make requests.
  final ProductClient _client;

  /// Method to load the products.
  Future<List<Product>> loadProducts() {
    return _client.loadProducts();
  }
}
