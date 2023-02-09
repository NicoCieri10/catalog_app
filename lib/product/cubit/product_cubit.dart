import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:product_client/product_client.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  final formKey = GlobalKey<FormState>();

  final status = ProductStatus;

  Product? product;

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void changeState(ProductStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }

  // Product update() => Product(
  //       available: product?.available ?? false,
  //       name: product?.name ?? '',
  //       picture: product?.picture,
  //       price: product?.price ?? 0,
  //       id: product?.id,
  //     );

  void updateAvailability({required bool value}) {
    product?.available = value;
    emit(
      state.copyWith(
        availability: value,
      ),
    );
  }
}
