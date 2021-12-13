import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahabatqu/models/quran_model.dart';
import 'package:sahabatqu/resources/api_repository.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc() : super(QuranInitial());

  final ApiRespository _apiRespository = ApiRespository();

  QuranState get initialState => QuranInitial();

  @override
  Stream<QuranState> mapEventToState(
    QuranEvent event,
  ) async* {
    if (event is GetQuranList) {
      try {
        yield QuranLoading();
        final quranList = await _apiRespository.fetchQuranList();
        yield QuranLoaded(quranList);
        if (quranList == null) {
          yield QuranLoadError(
              "Gagal mengambil data. apakah perangkatmu online?");
        }
      } on NetworkError {
        yield QuranLoadError(
            "Gagal mengambil data. apakah perangkatmu online?");
      }
    }
  }
}
