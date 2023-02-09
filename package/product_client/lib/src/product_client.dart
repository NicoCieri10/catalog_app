import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_client/src/models/models.dart';

/// {@template product_client}
/// The Client used to make requests to the Product Database.
/// {@endtemplate}
class ProductClient {
  /// {@macro product_client}
  ProductClient() {
    loadProducts();
  }

  /// The client used to make requests.
  final _client = http.Client();

  static const _baseUrl =
      'flutter-catalog-app-9a394-default-rtdb.firebaseio.com';

  /// A method to make the request to the Database.
  Future<List<Product>> loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await _client.get(url);
    final body = (jsonDecode(resp.body) as Map).cast<String, dynamic>();

    try {
      return body
          .map((key, value) {
            final tempProduct = Product.fromMap(
              (value as Map).cast<String, dynamic>(),
            )..id = key;
            return MapEntry(key, tempProduct);
          })
          .values
          .toList();
    } catch (e) {
      throw const SpecifiedTypeNotMatchedException();
    }
  }

  /// A method to save changes or create a new Product
  Future<void> saveOrCreateProduct(Product? product) async {
    if (product?.id == null) {
    } else {
      await updateProduct(product);
    }
  }

  /// A method to update a Product
  Future<String?> updateProduct(Product? product) async {
    final url = Uri.https(_baseUrl, 'products/${product?.id}.json');
    await _client.put(url, body: product?.toJson());

    return product?.id;
  }
}

/// {@template specified_type_not_matched_exception}
/// Thrown if an http response doesn't match the expected type.
/// {@endtemplate}
class SpecifiedTypeNotMatchedException implements Exception {
  /// {@macro specified_type_not_matched_exception}
  const SpecifiedTypeNotMatchedException();
}

/// An extension to add an `isSuccess` and `isFailure` property
/// to the [http.Response] class.
extension Result on http.Response {
  /// Returns true if the response is a success.
  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  /// Returns true if the response is a failure.
  bool get isFailure => !isSuccess;
}
