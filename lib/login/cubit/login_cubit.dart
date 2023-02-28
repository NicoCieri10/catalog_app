import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:product_repository/product_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(
          LoginState(
            formKey: GlobalKey<FormState>(),
          ),
        );

  String email = '';
  String password = '';

  final ProductRepository _productRepository;

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

  Future<bool> login() async {
    emit(
      state.copyWith(status: LoginStatus.attempting),
    );

    try {
      final errorMessage =
          await _productRepository.login(state.email, state.password);

      if (errorMessage == null) {
        emit(
          state.copyWith(status: LoginStatus.success),
        );
        return true;
      } else {
        emit(
          state.copyWith(status: LoginStatus.failure),
        );
        return false;
      }
    } catch (error) {
      emit(
        state.copyWith(status: LoginStatus.failure),
      );

      return false;
    }
  }

  void changeState(LoginStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }
}
