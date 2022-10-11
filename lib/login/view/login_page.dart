import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/ui/ui.dart';
import 'package:form_validation/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const name = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250.sp,
              ),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10.sp),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 30.sp),
                    _LoginForm(),
                  ],
                ),
              ),
              SizedBox(height: 50.sp),
              const Text(
                'Crear una nueva cuenta',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
