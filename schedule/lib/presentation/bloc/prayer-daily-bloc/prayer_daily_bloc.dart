import 'package:core/domain/entities/prayer/prayer_daily_response_e.dart';
import 'package:core/domain/usecases/prayer/get_prayer_schedule_daily.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'prayer_daily_event.dart';
part 'prayer_daily_state.dart';

class PrayerDailyBloc extends Bloc<PrayerDailyEvent, PrayerDailyState> {
  final GetPrayerScheduleDaily getPrayerScheduleDaily;

  PrayerDailyBloc(this.getPrayerScheduleDaily)
      : super(const PrayerDailyEmpty()) {
    on<GetPrayerDaily>(_fetchPrayerDaily);
  }

  Future<void> _fetchPrayerDaily(
      GetPrayerDaily event, Emitter<PrayerDailyState> emit) async {
    emit(PrayerDailyLoading());

    final data = await getPrayerScheduleDaily.execute(event.cityId, event.date);

    data.fold((failure) {
      emit(PrayerDailyError(failure.message));
    }, (success) {
      emit(PrayerDailyLoaded(success));
    });
  }
}
