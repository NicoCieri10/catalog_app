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
    this.newImage,
  });

  final ProductStatus status;
  final Product product;
  final GlobalKey<FormState> formKey;
  final File? newImage;

  ProductState copyWith({
    ProductStatus? status,
    Product? product,
    File? newImage,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
      formKey: formKey,
      newImage: newImage ?? this.newImage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        product,
        formKey,
        newImage,
      ];
}
