part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  attempting,
  success,
  failure,
}

class HomeState extends Equatable {
  HomeState({
    this.status = HomeStatus.initial,
    required this.products,
    this.selectedProduct,
  });

  final HomeStatus status;
  final List<Product> products;
  late Product? selectedProduct;

  @override
  List<Object?> get props => [
        status,
        products,
        selectedProduct,
      ];

  HomeState copyWith({
    HomeStatus? status,
    List<Product>? products,
    Product? selectedProduct,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      selectedProduct: selectedProduct ?? this.selectedProduct,
    );
  }
}
