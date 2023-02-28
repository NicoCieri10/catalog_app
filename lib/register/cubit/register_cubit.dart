import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:product_repository/product_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(
          RegisterState(
            formKey: GlobalKey<FormState>(),
          ),
        );

  String email = '';
  String password = '';

  final ProductRepository _productRepository;

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

  Future<bool> createUser() async {
    emit(
      state.copyWith(status: RegisterStatus.attempting),
    );

    try {
      final errorMessage =
          await _productRepository.createUser(state.email, state.password);

      if (errorMessage == null) {
        emit(
          state.copyWith(status: RegisterStatus.success),
        );
        return true;
      } else {
        emit(
          state.copyWith(status: RegisterStatus.failure),
        );
        return false;
      }
    } catch (error) {
      emit(
        state.copyWith(status: RegisterStatus.failure),
      );

      return false;
    }
  }

  void changeState(RegisterStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }
}
