import 'package:flutter_bloc/flutter_bloc.dart';
import 'cafe_event.dart';
import 'cafe_state.dart';

class CafeBloc extends Bloc<CafeEvent, CafeState> {
  CafeBloc() : super(CafeInitial()) {
    on<LoadCafes>((event, emit) async {
      emit(CafeLoading());
      try {
        await Future.delayed(Duration(seconds: 1)); // Заменить на Dio-запрос
        emit(CafeLoaded(['Кафе A', 'Кафе B', 'Кафе C']));
      } catch (e) {
        emit(CafeError('Ошибка загрузки кафе'));
      }
    });
  }
}
