part of 'product_cubit.dart';

enum ProductStatus {
  initial,
  attempting,
  success,
  failure,
}

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
  });

  final ProductStatus status;

  @override
  List<Object> get props => [
        status,
      ];

  ProductState copyWith({
    ProductStatus? status,
  }) {
    return ProductState(
      status: status ?? this.status,
    );
  }
}
