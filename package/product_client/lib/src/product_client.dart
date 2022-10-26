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
  // final _client = http.Client();

  static const _baseUrl =
      'flutter-catalog-app-9a394-default-rtdb.firebaseio.com';

  /// The list of products
  final List<Product> products = [];

  //ToDo implementar cubit/TryCatch
  bool isLoading = true;

  /// A method to make the request to the Database.
  Future loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final productsMap = jsonDecode(resp.body) as Map<String, dynamic>
      ..forEach((key, value) {
        final tempProduct = Product.fromMap(value as Map<String, dynamic>)
          ..id = key;
        products.add(tempProduct);
      });

    print(products[1].name);
  }
}
