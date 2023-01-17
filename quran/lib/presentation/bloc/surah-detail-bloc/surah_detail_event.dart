part of 'surah_detail_bloc.dart';

abstract class SurahDetailEvent extends Equatable {}

class GetSurahDetail extends SurahDetailEvent {
  final String nomor;
  final int firstCount;
  final int lastCount;
  final bool isClear;

  GetSurahDetail(this.nomor, this.firstCount, this.lastCount, this.isClear);

  @override
  List<Object?> get props => [nomor, firstCount, lastCount, isClear];
}
