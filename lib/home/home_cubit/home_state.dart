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
    required this.products,
  });

  final HomeStatus status;
  final List<Product> products;

  @override
  List<Object?> get props => [
        status,
        products,
      ];

  HomeState copyWith({
    HomeStatus? status,
    List<Product>? products,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
