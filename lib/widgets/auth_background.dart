import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // height: double.infinity,
      // width: double.infinity,
      child: Stack(
        children: [
          const _PurpleBox(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.sp),
              child: Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 100.sp,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(
            top: 90.sp,
            left: 30.sp,
            child: const _Buggle(),
          ),
          Positioned(
            top: -40.sp,
            left: -30.sp,
            child: const _Buggle(),
          ),
          Positioned(
            top: -50.sp,
            right: -20.sp,
            child: const _Buggle(),
          ),
          Positioned(
            bottom: -50.sp,
            left: 10.sp,
            child: const _Buggle(),
          ),
          Positioned(
            bottom: 120.sp,
            right: 20.sp,
            child: const _Buggle(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1),
        ],
      ),
    );
  }
}

class _Buggle extends StatelessWidget {
  const _Buggle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
