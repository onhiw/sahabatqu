import 'package:core/domain/entities/quran/surah.dart';
import 'package:core/domain/usecases/quran/get_all_surah.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final GetAllSurah getAllSurah;
  SurahBloc(this.getAllSurah) : super(const SurahEmpty()) {
    on<FetchAllSurah>(_fetchAllSurah);
  }

  Future<void> _fetchAllSurah(
      FetchAllSurah event, Emitter<SurahState> emit) async {
    emit(SurahLoading());

    final data = await getAllSurah.execute();

    data.fold((failure) {
      emit(SurahError(failure.message));
    }, (success) {
      success.isEmpty ? emit(const SurahEmpty()) : emit(SurahLoaded(success));
    });
  }
}
