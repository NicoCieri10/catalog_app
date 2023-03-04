import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:product_client/src/models/models.dart';

/// {@template product_client}
/// The Client used to make requests to the [Product] Database.
/// {@endtemplate}
class ProductClient {
  /// {@macro product_client}
  ProductClient() {
    loadProducts();
  }

  /// The secure storage
  static const storage = FlutterSecureStorage();

  final _client = http.Client();

  static const _baseUrl =
      'flutter-catalog-app-9a394-default-rtdb.firebaseio.com';

  static const _baseAuthUrl = 'identitytoolkit.googleapis.com';

  static const _firebaseToken = 'AIzaSyDiutNqrURTB8Y-_loerpC35feM2rPQ6PI';

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

  /// A method to save changes or create a new [Product].
  Future<void> saveOrCreateProduct(Product? product) async {
    if (product?.id == null) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }
  }

  /// A method to upload the Image of the [Product] to the DataBase.
  Future<String?> uploadProductImage(String path) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/dktthsxm2/image/upload?upload_preset=mk00jfhc',
    );
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    final decodedData = (jsonDecode(resp.body) as Map).cast<String, dynamic>();

    return decodedData['secure_url'].toString();
  }

  /// A method to update a [Product].
  Future<String?> updateProduct(Product? product) async {
    final url = Uri.https(_baseUrl, 'products/${product?.id}.json');
    await _client.put(url, body: product?.toJson());

    return product?.id;
  }

  /// A method to create a [Product].
  Future<String?> createProduct(Product? product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await _client.post(url, body: product?.toJson());

    final body = (jsonDecode(resp.body) as Map).cast<String, dynamic>();

    try {
      return product?.id = body['name'].toString();
    } catch (e) {
      throw const SpecifiedTypeNotMatchedException();
    }
  }

  /// A method to create a User.
  Future<String?>? createUser(String email, String password) async {
    final authData = <String, dynamic>{'email': email, 'password': password};

    final url = Uri.https(
      _baseAuthUrl,
      '/v1/accounts:signUp',
      {'key': _firebaseToken},
    );

    final resp = await http.post(url, body: jsonEncode(authData));

    final decodedResp = (jsonDecode(resp.body) as Map).cast<String, dynamic>();

    try {
      if (decodedResp.containsKey('idToken')) {
        await storage.write(
          key: 'token',
          value: decodedResp['idToken'].toString(),
        );
        return null;
      } else {
        return decodedResp['message'].toString();
      }
    } catch (e) {
      throw const SpecifiedTypeNotMatchedException();
    }
  }

  /// A method to login.
  Future<String?>? login(String email, String password) async {
    final authData = <String, dynamic>{'email': email, 'password': password};

    final url = Uri.https(
      _baseAuthUrl,
      '/v1/accounts:signInWithPassword',
      {'key': _firebaseToken},
    );

    final resp = await http.post(url, body: jsonEncode(authData));

    final decodedResp = (jsonDecode(resp.body) as Map).cast<String, dynamic>();

    try {
      if (decodedResp.containsKey('idToken')) {
        await storage.write(
          key: 'token',
          value: decodedResp['idToken'].toString(),
        );
        return null;
      } else {
        return (decodedResp['error'] as Map<String, dynamic>)['message']
            .toString();
      }
    } catch (e) {
      throw const SpecifiedTypeNotMatchedException();
    }
  }

  /// A method to logout
  Future<void> logout() async {
    await storage.delete(key: 'token');

    return;
  }

  /// A method to read the token
  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
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
