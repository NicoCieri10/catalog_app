import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

part 'check_auth_state.dart';

class CheckAuthCubit extends Cubit<CheckAuthState> {
  CheckAuthCubit({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(
          const CheckAuthState(),
        );

  final ProductRepository _productRepository;
  final status = CheckAuthStatus;

  Future<String> readToken() async {
    emit(
      state.copyWith(status: CheckAuthStatus.attempting),
    );

    try {
      final token = await _productRepository.readToken();

      emit(
        state.copyWith(
          status: CheckAuthStatus.success,
          token: token,
        ),
      );

      return token;
    } catch (error) {
      state.copyWith(status: CheckAuthStatus.failure);
    }

    return '';
  }
}
