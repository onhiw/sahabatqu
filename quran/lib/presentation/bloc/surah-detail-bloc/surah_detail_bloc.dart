import 'package:core/domain/entities/quran/ayah.dart';
import 'package:core/domain/entities/quran/ayah_response_e.dart';
import 'package:core/domain/usecases/quran/get_ayah_by_surah_no.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'surah_detail_event.dart';
part 'surah_detail_state.dart';

class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  final GetAyahBySurahNo getAyahBySurahNo;
  List<Ayah> ayah = [];

  SurahDetailBloc(this.getAyahBySurahNo) : super(const SurahDetailEmpty()) {
    on<GetSurahDetail>(_fetchSurahDetail);
  }

  Future<void> _fetchSurahDetail(
      GetSurahDetail event, Emitter<SurahDetailState> emit) async {
    if (event.isClear) {
      ayah.clear();
    }

    if (ayah.isEmpty) {
      emit(SurahDetailLoading());
    }

    final data = await getAyahBySurahNo.execute(
        event.nomor, event.firstCount, event.lastCount);

    data.fold((failure) {
      emit(SurahDetailError(failure.message));
    }, (success) {
      if (success.data.isNotEmpty) {
        ayah.addAll(success.data);
      }

      emit(SurahDetailLoaded(success, removeDuplicates(ayah)));
    });
  }

  List<Ayah> removeDuplicates(List<Ayah> items) {
    List<Ayah> uniqueItems = []; // uniqueList
    var uniqueIDs =
        items.map((e) => e.id).toSet(); //list if UniqueID to remove duplicates
    for (var e in uniqueIDs) {
      uniqueItems.add(items.firstWhere((i) => i.id == e));
    } // populate uniqueItems with equivalent original Batch items
    return uniqueItems; //send back the unique items list
  }
}
