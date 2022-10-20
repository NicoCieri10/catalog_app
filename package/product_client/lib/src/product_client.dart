import 'package:product_client/src/models/models.dart';

/// {@template movies_client}
/// The Client used to make requests to the Product Database.
/// {@endtemplate}
class ProductClient {
  static const _baseUrl =
      'flutter-catalog-app-9a394-default-rtdb.firebaseio.com';

  final List<Product> products = [];
}
