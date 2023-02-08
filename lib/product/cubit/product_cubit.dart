import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:product_client/product_client.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  final formKey = GlobalKey<FormState>();

  final status = ProductStatus;

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

  // TODO: usar un set en lugar de una funcion
  void updateAvailability({required bool value}) {
    // print(value);
    state.product?.available = value;
    // state.copyWith(
    //   product: Product(
    //     available: value,
    //     name: state.product!.name,
    //     price: state.product!.price,
    //     id: state.product!.id,
    //     picture: state.product!.picture,
    //   ),
    // );
  }

  void actualProduct(Product? product) {
    state.copyWith(
      product: product,
    );
  }
}
