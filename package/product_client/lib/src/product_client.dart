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

  /// The list of products
  final List<Product> products = [];

  //ToDo implementar cubit/TryCatch

  bool isLoading = true;

  /// A method to make the request to the Database.
  Future<List<Product>> loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await _client.get(url);

    final productsMap = jsonDecode(resp.body) as Map<String, dynamic>
      ..forEach((key, value) {
        final tempProduct = Product.fromMap(value as Map<String, dynamic>)
          ..id = key;
        products.add(tempProduct);
      });

    try {
      return products;
    } catch (e) {
      throw const SpecifiedTypeNotMatchedException();
    }
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
