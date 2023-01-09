import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/quran/ayah_response_a.dart';
import 'package:core/domain/usecases/quran/get_ayah_by_surah_no.dart';
import 'package:equatable/equatable.dart';

part 'surah_detail_event.dart';
part 'surah_detail_state.dart';

class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  final GetAyahBySurahNo getAyahBySurahNo;
  SurahDetailBloc(this.getAyahBySurahNo) : super(const SurahDetailEmpty()) {
    on<GetSurahDetail>(_fetchSurahDetail);
  }

  Future<void> _fetchSurahDetail(
      GetSurahDetail event, Emitter<SurahDetailState> emit) async {
    emit(SurahDetailLoading());

    final data = await getAyahBySurahNo.execute(event.nomor);

    data.fold((failure) {
      emit(SurahDetailError(failure.message));
    }, (success) {
      emit(SurahDetailLoaded(success));
    });
  }
}
