import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, this.url});

  final String? url;

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
        height: 450.sp,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.sp),
            topRight: Radius.circular(45.sp),
          ),
          child: url == null
              ? const Image(
                  image: AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover,
                )
              : FadeInImage(
                  image: NetworkImage(
                    url!,
                  ),
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45.sp),
          topRight: Radius.circular(45.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      );
}
