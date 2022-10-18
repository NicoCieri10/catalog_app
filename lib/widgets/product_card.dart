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
          alignment: Alignment.bottomLeft,
          children: const [
            _BackgroundImage(),
            _ProductsDetails(),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: _NotAvailable(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(25.sp),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 5),
          blurRadius: 10,
        ),
      ],
    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable();

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
  const _PriceTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      height: 60.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
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
            r'$111.11',
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
  const _ProductsDetails();

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
              'Product',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'ProductID',
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
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.sp),
          topRight: Radius.circular(25.sp),
        ),
      );
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.sp),
      child: SizedBox(
        width: double.infinity,
        height: 400.sp,
        child: const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
