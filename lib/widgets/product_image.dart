import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:product_client/product_client.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
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
            topLeft: Radius.circular(45.sp),
            topRight: Radius.circular(45.sp),
          ),
          child: product?.picture == null
              ? const Image(
                  image: AssetImage('assets/no-image.png'),
                  fit: BoxFit.fill,
                )
              : FadeInImage(
                  image: NetworkImage(
                    product!.picture!,
                  ),
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  fit: BoxFit.contain,
                ),
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
