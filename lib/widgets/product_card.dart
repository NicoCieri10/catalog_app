import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
          children: const [
            _BackgroundImage(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
      color: Colors.brown[900],
      borderRadius: BorderRadius.circular(25.sp),
      boxShadow: const [
        BoxShadow(
          offset: Offset(0, 5),
          blurRadius: 10,
        )
      ],
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400.sp,
      child: const FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
      ),
    );
  }
}
