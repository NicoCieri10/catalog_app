import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final GlobalKey formKey = GlobalKey<FormState>();

  bool isValidForm() {
    print(formKey.currentState);

    return formKey.currentState != null;
  }
}
