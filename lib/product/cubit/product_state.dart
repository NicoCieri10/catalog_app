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
    this.availability = false,
  });

  final ProductStatus status;
  final bool availability;

  @override
  List<Object> get props => [
        status,
        availability,
      ];

  ProductState copyWith({
    ProductStatus? status,
    bool? availability,
  }) {
    return ProductState(
      status: status ?? this.status,
      availability: availability ?? this.availability,
    );
  }
}
