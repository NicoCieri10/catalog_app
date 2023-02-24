part of 'register_cubit.dart';

enum RegisterStatus {
  initial,
  attempting,
  success,
  failure,
}

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.email = '',
    this.password = '',
    required this.formKey,
  });

  final String email;
  final String password;
  final RegisterStatus status;
  final GlobalKey<FormState> formKey;

  RegisterState copyWith({
    String? email,
    String? password,
    RegisterStatus? status,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        formKey,
      ];
}
