part of 'surah_detail_bloc.dart';

abstract class SurahDetailEvent extends Equatable {}

class GetSurahDetail extends SurahDetailEvent {
  final String nomor;

  GetSurahDetail(this.nomor);

  @override
  List<Object?> get props => [nomor];
}
