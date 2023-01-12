import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/quran/ayah.dart';
import 'package:core/domain/entities/quran/ayah_response_a.dart';
import 'package:core/domain/usecases/quran/get_ayah_by_surah_no.dart';
import 'package:equatable/equatable.dart';

part 'surah_detail_event.dart';
part 'surah_detail_state.dart';

class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  final GetAyahBySurahNo getAyahBySurahNo;
  List<Ayah> ar = [];
  List<Ayah> id = [];

  SurahDetailBloc(this.getAyahBySurahNo) : super(const SurahDetailEmpty()) {
    on<GetSurahDetail>(_fetchSurahDetail);
  }

  Future<void> _fetchSurahDetail(
      GetSurahDetail event, Emitter<SurahDetailState> emit) async {
    emit(SurahDetailLoading());

    final data = await getAyahBySurahNo.execute(
        event.nomor, event.firstCount, event.lastCount);

    data.fold((failure) {
      emit(SurahDetailError(failure.message));
    }, (success) {
      int lastCount = int.parse(success.surah.ayat) < 10
          ? int.parse(success.surah.ayat)
          : event.lastCount;
      if (lastCount <= int.parse(success.surah.ayat)) {
        if (success.ayahResponseE.ayahData.ar.isNotEmpty) {
          ar.addAll(success.ayahResponseE.ayahData.ar);
        }
        if (success.ayahResponseE.ayahData.id.isNotEmpty) {
          id.addAll(success.ayahResponseE.ayahData.id);
        }
      }
      emit(SurahDetailLoaded(success, ar, id));
    });
  }
}
