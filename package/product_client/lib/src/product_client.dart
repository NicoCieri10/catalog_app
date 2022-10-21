import 'package:product_client/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// {@template movies_client}
/// The Client used to make requests to the Product Database.
/// {@endtemplate}
class ProductClient {
  ProductClient() {
    this.loadProducts();
  }

  static const _baseUrl =
      'flutter-catalog-app-9a394-default-rtdb.firebaseio.com';

  final List<Product> products = [];

  //ToDo implementar cubit/TryCatch
  bool isLoading = true;

  Future<List<Product>> loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);
    print(productsMap);
  }
}
