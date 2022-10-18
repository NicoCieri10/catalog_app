import 'package:flutter/material.dart';
import 'package:form_validation/widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const name = 'product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: const [
                ProductImage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
