import 'package:core/domain/entities/prayer/prayer_monthly_response_e.dart';
import 'package:core/domain/usecases/prayer/get_prayer_schedule_monthly.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'prayer_monthly_event.dart';
part 'prayer_monthly_state.dart';

class PrayerMonthlyBloc extends Bloc<PrayerMonthlyEvent, PrayerMonthlyState> {
  final GetPrayerScheduleMonthly getPrayerScheduleMonthly;
  PrayerMonthlyBloc(this.getPrayerScheduleMonthly)
      : super(const PrayerMonthlyEmpty()) {
    on<GetPrayerMonthly>(_fetchPrayerMonthly);
  }

  Future<void> _fetchPrayerMonthly(
      GetPrayerMonthly event, Emitter<PrayerMonthlyState> emit) async {
    emit(PrayerMonthlyLoading());

    final data = await getPrayerScheduleMonthly.execute(
        event.cityId, event.year, event.month);

    data.fold((failure) {
      emit(PrayerMonthlyError(failure.message));
    }, (success) {
      emit(PrayerMonthlyLoaded(success));
    });
  }
}
