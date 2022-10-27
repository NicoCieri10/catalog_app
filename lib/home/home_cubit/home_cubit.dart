import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final status = HomeStatus;

  void changeState(HomeStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }
}
