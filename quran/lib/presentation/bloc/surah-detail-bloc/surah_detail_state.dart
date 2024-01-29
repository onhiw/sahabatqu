part of 'surah_detail_bloc.dart';

abstract class SurahDetailState extends Equatable {
  const SurahDetailState();

  @override
  List<Object?> get props => [];
}

class SurahDetailEmpty extends SurahDetailState {
  const SurahDetailEmpty();

  @override
  List<Object?> get props => [];
}

class SurahDetailLoading extends SurahDetailState {}

class SurahDetailLoaded extends SurahDetailState {
  final AyahResponseE ayahResponseE;
  final List<Ayah> ayah;
  const SurahDetailLoaded(this.ayahResponseE, this.ayah);

  @override
  List<Object?> get props => [ayahResponseE, ayah];
}

class SurahDetailError extends SurahDetailState {
  final String message;

  const SurahDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
