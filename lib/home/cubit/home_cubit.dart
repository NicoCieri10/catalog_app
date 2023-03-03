import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_client/product_client.dart';
import 'package:product_repository/product_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required ProductRepository productRepository,
    required Product product,
  })  : _productRepository = productRepository,
        super(
          HomeState(
            product: product,
          ),
        );

  final ProductRepository _productRepository;
  final status = HomeStatus;

  Future<void> loadProducts() async {
    emit(
      state.copyWith(status: HomeStatus.attempting),
    );

    try {
      final newProducts = await _productRepository.loadProducts();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          products: newProducts,
        ),
      );
    } catch (error) {
      state.copyWith(status: HomeStatus.failure);
    }
  }

  Future<void> editProduct() async {
    emit(
      state.copyWith(status: HomeStatus.attempting),
    );

    try {
      await _productRepository.saveOrCreateProduct(state.product);

      emit(
        state.copyWith(
          status: HomeStatus.success,
        ),
      );
    } catch (error) {
      state.copyWith(status: HomeStatus.failure);
    }
  }

  void logout() {
    emit(
      state.copyWith(status: HomeStatus.attempting),
    );

    try {
      _productRepository.logout();

      emit(
        state.copyWith(
          status: HomeStatus.success,
        ),
      );
    } catch (error) {
      state.copyWith(status: HomeStatus.failure);
    }
  }

  void changeState(HomeStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }
}
