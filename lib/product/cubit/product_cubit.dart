import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:product_client/product_client.dart';
import 'package:product_repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductState());

  final ProductRepository _productRepository;
  final formKey = GlobalKey<FormState>();
  final status = ProductStatus;

  Product? product;

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> editProduct(Product? product) async {
    emit(
      state.copyWith(status: ProductStatus.attempting),
    );

    try {
      await _productRepository.saveOrCreateProduct(product);

      emit(
        state.copyWith(
          status: ProductStatus.success,
        ),
      );
    } catch (error) {
      state.copyWith(status: ProductStatus.failure);
    }
  }

  void changeState(ProductStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }

  void updateAvailability({required bool value}) {
    product?.available = value;
    emit(
      state.copyWith(
        availability: value,
      ),
    );
  }
}
