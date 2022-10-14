import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/login/cubit/login_cubit.dart';
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
                    BlocProvider(
                      create: (_) => LoginCubit(),
                      child: const _LoginForm(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.sp),
              const Text(
                'Crear una nueva cuenta',
              ),
              SizedBox(height: 50.sp),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = BlocProvider.of<LoginCubit>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'john.doe@gmail.com',
              labelText: 'Email',
              prefixIcon: Icons.alternate_email_rounded,
            ),
            onChanged: loginForm.addEmail,
            validator: (value) {
              const pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              final regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Ingrese un correo válido';
            },
          ),
          SizedBox(height: 30.sp),
          TextFormField(
            obscureText: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: '******',
              labelText: 'Password',
              prefixIcon: Icons.lock_outline,
            ),
            onChanged: loginForm.addPassword,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'Ingrese una contraseña válida (min. 6 caracteres)';
            },
          ),
          SizedBox(height: 30.sp),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            onPressed: loginForm.isValidForm,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 80.sp,
                vertical: 15.sp,
              ),
              child: const Text(
                'Ingresar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
