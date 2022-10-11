import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration() {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2.sp,
        ),
      ),
      labelText: 'Email',
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      prefixIcon: const Icon(
        Icons.alternate_email_sharp,
        color: Colors.deepPurple,
      ),
    );
  }
}
