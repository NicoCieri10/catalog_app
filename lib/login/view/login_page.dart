import 'package:flutter/material.dart';
import 'package:form_validation/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const name = 'login';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackground(),
    );
  }
}
