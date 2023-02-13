import 'dart:io';

import 'package:appsize/appsize.dart';
import 'package:catalog_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:product_client/product_client.dart';

/// A class for the product card
class ProductCard extends StatelessWidget {
  /// The ProductCard constructor
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Container(
        margin: EdgeInsets.only(
          top: 30.sp,
          bottom: 50.sp,
        ),
        width: double.infinity,
        height: 400.sp,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(product),
            _ProductsDetails(product),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(product),
            ),
            if (!product.available)
              Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable(product),
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25.sp),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
        ),
      ],
    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      height: 60.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25.sp),
          topLeft: Radius.circular(25.sp),
        ),
      ),
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
          ),
          child: Text(
            'N/A',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      height: 60.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: myThemeLight.hintColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.sp),
          bottomLeft: Radius.circular(25.sp),
        ),
      ),
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
          ),
          child: Text(
            '\$${product.price}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductsDetails extends StatelessWidget {
  const _ProductsDetails(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50.sp),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.sp,
          vertical: 10.sp,
        ),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product.id ?? '',
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: myThemeLight.hintColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.sp),
          topRight: Radius.circular(25.sp),
        ),
      );
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.sp),
      child: SizedBox(
        width: double.infinity,
        height: 400.sp,
        // ToDo: ver qué onda con esto
        child: DisplayImage(product: product),
      ),
    );
  }
}

class DisplayImage extends StatelessWidget {
  const DisplayImage({
    super.key,
    required this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    if (product?.picture == null) {
      return const Image(
        image: AssetImage('assets/no-image.png'),
        fit: BoxFit.cover,
      );
    }

    if (product!.picture!.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(
          product!.picture!,
        ),
        placeholder: const AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.contain,
      );
    }

    return Image.file(
      File(product!.picture!),
      fit: BoxFit.cover,
    );
  }
}
