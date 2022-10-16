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
    return formKey.currentState?.validate() ?? false;
  }

  final status = LoginStatus;

  void addEmail(String newEmail) {
    emit(
      state.copyWith(
        status: LoginStatus.success,
        email: newEmail,
      ),
    );
  }

  void addPassword(String newPassword) {
    emit(
      state.copyWith(
        status: LoginStatus.success,
        password: newPassword,
      ),
    );
  }

  void changeState(LoginStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }
}
