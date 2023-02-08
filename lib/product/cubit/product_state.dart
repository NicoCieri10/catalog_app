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
    this.product,
  });

  final ProductStatus status;
  final Product? product;

  @override
  List<Object> get props => [
        status,
        product!,
      ];

  ProductState copyWith({
    ProductStatus? status,
    Product? product,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
    );
  }
}
