part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  attempting,
  success,
  failure,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
  });

  final HomeStatus status;

  @override
  List<Object?> get props => [
        status,
      ];

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }
}
