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

  /// Method to save or create a product.
  Future<void> saveOrCreateProduct(Product? product) async {
    return _client.saveOrCreateProduct(product);
  }
}
