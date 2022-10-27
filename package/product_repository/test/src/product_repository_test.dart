// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:product_client/product_client.dart';
import 'package:product_repository/product_repository.dart';
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';

void main() {
  group('ProductRepository', () {
    test('can be instantiated', () {
      final productClient = ProductClient();
      expect(ProductRepository(productClient), isNotNull);
    });
  });
}
