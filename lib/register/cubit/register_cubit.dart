import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(
          RegisterState(
            formKey: GlobalKey<FormState>(),
          ),
        );

  String email = '';
  String password = '';

  final status = RegisterStatus;

  void addEmail(String newEmail) {
    emit(
      state.copyWith(
        status: RegisterStatus.success,
        email: newEmail,
      ),
    );
  }

  void addPassword(String newPassword) {
    emit(
      state.copyWith(
        status: RegisterStatus.success,
        password: newPassword,
      ),
    );
  }

  void changeState(RegisterStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }
}
