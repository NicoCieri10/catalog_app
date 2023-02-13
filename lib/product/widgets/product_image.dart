import 'dart:io';

import 'package:appsize/appsize.dart';
import 'package:catalog_app/product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_client/product_client.dart';

/// A class for the image product
class ProductImage extends StatelessWidget {
  /// ProductImage constructor
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.select<ProductCubit, Product?>(
      (value) => value.state.product,
    );

    return Padding(
      padding: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        top: 10.sp,
      ),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 380.sp,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.sp),
            topRight: Radius.circular(25.sp),
          ),
          child: DisplayImage(product: product),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: const Color.fromARGB(255, 246, 246, 246),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.sp),
          topRight: Radius.circular(25.sp),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      );
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
