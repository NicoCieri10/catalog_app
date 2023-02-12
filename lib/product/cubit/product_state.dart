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
    this.image = '',
  });

  final ProductStatus status;
  final Product product;
  final GlobalKey<FormState> formKey;
  final String image;

  ProductState copyWith({
    ProductStatus? status,
    Product? product,
    String? image,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
      formKey: formKey,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        status,
        product,
        formKey,
        image,
      ];
}
