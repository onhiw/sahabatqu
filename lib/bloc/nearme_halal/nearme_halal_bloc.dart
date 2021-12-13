import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahabatqu/models/nearme_halal_model.dart';
import 'package:sahabatqu/resources/api_repository.dart';

part 'nearme_halal_event.dart';
part 'nearme_halal_state.dart';

class NearmeHalalBloc extends Bloc<NearmeHalalEvent, NearmeHalalState> {
  NearmeHalalBloc() : super(NearmeHalalInitial());

  final ApiRespository _apiRespository = ApiRespository();

  NearmeHalalState get initialState => NearmeHalalInitial();

  @override
  Stream<NearmeHalalState> mapEventToState(
    NearmeHalalEvent event,
  ) async* {
    if (event is GetNearmeHalal) {
      try {
        yield NearmeHalalLoading();
        final dataList = await _apiRespository.fetchNeameHalal(
            event.lat, event.long, event.date);
        yield NearmeHalalLoaded(dataList);
        if (dataList == null) {
          yield NearmeHalalError(
              "Gagal mengambil data. apakah perangkatmu online?");
        }
      } on NetworkError {
        yield NearmeHalalError(
            "Gagal mengambil data. apakah perangkatmu online?");
      }
    }
  }
}
