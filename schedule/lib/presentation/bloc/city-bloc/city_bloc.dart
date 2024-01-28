import 'package:core/domain/entities/prayer/city.dart';
import 'package:core/domain/usecases/prayer/get_all_city.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final GetAllCity getAllCity;

  CityBloc(this.getAllCity) : super(const CityEmpty()) {
    on<FetchAllCity>(_fetchAllCity);
  }

  Future<void> _fetchAllCity(
      FetchAllCity event, Emitter<CityState> emit) async {
    emit(CityLoading());

    final data = await getAllCity.execute();

    data.fold((failure) {
      emit(CityError(failure.message));
    }, (success) {
      success.isEmpty ? emit(const CityEmpty()) : emit(CityLoaded(success));
    });
  }
}
