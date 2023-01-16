import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/nearme/nearme.dart';
import 'package:core/domain/usecases/nearme/get_nearme.dart';
import 'package:equatable/equatable.dart';

part 'nearme_mosque_event.dart';
part 'nearme_mosque_state.dart';

class NearmeMosqueBloc extends Bloc<NearmeMosqueEvent, NearmeMosqueState> {
  final GetNearme getNearme;
  NearmeMosqueBloc(this.getNearme) : super(const NearmeMosqueEmpty()) {
    on<FetchNearmeMosque>(_fetchNearme);
  }

  Future<void> _fetchNearme(
      FetchNearmeMosque event, Emitter<NearmeMosqueState> emit) async {
    emit(NearmeMosqueLoading());

    final data = await getNearme.execute(event.location, event.type);

    data.fold((failure) {
      emit(NearmeMosqueError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(const NearmeMosqueEmpty())
          : emit(NearmeMosqueLoaded(success));
    });
  }
}
