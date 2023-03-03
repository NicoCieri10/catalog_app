part of 'check_auth_cubit.dart';

enum CheckAuthStatus {
  initial,
  attempting,
  success,
  failure,
}

class CheckAuthState extends Equatable {
  const CheckAuthState({
    this.status = CheckAuthStatus.initial,
    this.token = '',
  });

  final CheckAuthStatus status;

  final String token;

  CheckAuthState copyWith({
    CheckAuthStatus? status,
    String? token,
  }) {
    return CheckAuthState(
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [
        status,
        token,
      ];
}
