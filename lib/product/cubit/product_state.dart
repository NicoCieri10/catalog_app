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
    required this.product,
    required this.formKey,
  });

  final ProductStatus status;
  final Product product;
  final GlobalKey<FormState> formKey;

  ProductState copyWith({
    ProductStatus? status,
    Product? product,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [
        status,
        product,
        formKey,
      ];
}
