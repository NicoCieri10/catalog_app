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
    required this.product,
    this.products = const [],
  });

  final HomeStatus status;
  final Product product;
  final List<Product> products;

  HomeState copyWith({
    HomeStatus? status,
    List<Product>? products,
    Product? product,
  }) {
    return HomeState(
      status: status ?? this.status,
      product: product ?? this.product,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        status,
        product,
        products,
      ];
}
