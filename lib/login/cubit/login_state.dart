part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  attempting,
  success,
  failure,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
  });

  final String email;
  final String password;
  final LoginStatus status;

  @override
  List<Object?> get props => [
        email,
        password,
        status,
      ];

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
