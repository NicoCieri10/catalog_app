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

  /// Method to update the image of a product.
  Future<String?>? uploadProductImage(String path) {
    return _client.uploadProductImage(path);
  }

  /// Method to create a User.
  Future<String?> createUser(String email, String password) async {
    return _client.createUser(email, password);
  }

  /// Method to login.
  Future<String?> login(String email, String password) async {
    return _client.login(email, password);
  }

  /// Method to logout
  Future<void> logout() async {
    return _client.logout();
  }

  /// Method to read the token
  Future<String> readToken() async {
    return _client.readToken();
  }
}
