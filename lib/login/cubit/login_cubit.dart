import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() {
    return formKey.currentState?.validate() != null;
  }
}
