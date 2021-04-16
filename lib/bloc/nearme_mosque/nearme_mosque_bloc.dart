import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahabatqu/models/nearme_mosque_model.dart';
import 'package:sahabatqu/resources/api_repository.dart';

part 'nearme_mosque_event.dart';
part 'nearme_mosque_state.dart';

class NearmeMosqueBloc extends Bloc<NearmeMosqueEvent, NearmeMosqueState> {
  NearmeMosqueBloc() : super(NearmeMosqueInitial());

  final ApiRespository _apiRespository = ApiRespository();

  @override
  NearmeMosqueState get initialState => NearmeMosqueInitial();

  @override
  Stream<NearmeMosqueState> mapEventToState(
    NearmeMosqueEvent event,
  ) async* {
    if (event is GetNearmeMosqueList) {
      try {
        yield NearmeMosqueLoading();
        final mosqueList = await _apiRespository.fetchNeameMosque(
            event.lat, event.long, event.date);
        yield NearmeMosqueLoaded(mosqueList);
        if (mosqueList == null) {
          yield NearmeMosqueError(
              "Gagal mengambil data. apakah perangkatmu online?");
        }
      } on NetworkError {
        yield NearmeMosqueError(
            "Gagal mengambil data. apakah perangkatmu online?");
      }
    }
  }
}
