import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sahabatqu/models/jadwal_sholat_model.dart';
import 'package:sahabatqu/resources/api_repository.dart';

part 'schedule_pray_event.dart';
part 'schedule_pray_state.dart';

class SchedulePrayBloc extends Bloc<SchedulePrayEvent, SchedulePrayState> {
  SchedulePrayBloc() : super(SchedulePrayInitial());

  final ApiRespository _apiRespository = ApiRespository();

  SchedulePrayState get initialState => SchedulePrayInitial();

  @override
  Stream<SchedulePrayState> mapEventToState(
    SchedulePrayEvent event,
  ) async* {
    if (event is GetScheduleList) {
      try {
        yield ScheduleLoading();
        final scheduleList =
            await _apiRespository.fetchJadwalSholat(event.lat, event.long);
        yield ScheduleLoaded(scheduleList);
        if (scheduleList == null) {
          yield ScheduleError(
              "Gagal mengambil data. apakah perangkatmu online?");
        }
      } on NetworkError {
        yield ScheduleError("Gagal mengambil data. apakah perangkatmu online?");
      }
    }
  }
}
