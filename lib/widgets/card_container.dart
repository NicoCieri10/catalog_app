import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Container(
        padding: EdgeInsets.all(20.sp),
        width: double.infinity,
        decoration: _cardShape(),
        child: child,
      ),
    );
  }

  BoxDecoration _cardShape() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.sp,
            offset: const Offset(0, 5),
          )
        ]);
  }
}
