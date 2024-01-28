import 'package:core/domain/entities/nearme/nearme.dart';
import 'package:core/domain/usecases/nearme/get_nearme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nearme_event.dart';
part 'nearme_state.dart';

class NearmeBloc extends Bloc<NearmeEvent, NearmeState> {
  final GetNearme getNearme;

  NearmeBloc(this.getNearme) : super(const NearmeInitial()) {
    on<FetchNearme>(_fetchNearme);
  }

  Future<void> _fetchNearme(
      FetchNearme event, Emitter<NearmeState> emit) async {
    emit(NearmeLoading());

    final data = await getNearme.execute(event.location, event.type);

    data.fold((failure) {
      emit(NearmeError(failure.message));
    }, (success) {
      success.isEmpty ? emit(const NearmeEmpty()) : emit(NearmeLoaded(success));
    });
  }
}
