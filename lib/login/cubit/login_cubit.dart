import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool isValidForm() {
    print('$email - $password');
    return formKey.currentState?.validate() != null;
  }

  // TODO: complete cubit
  void addEmail(String newEmail) {}

  void addPassword(String newPassword) {}
}
