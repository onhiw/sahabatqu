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
  final AyahResponseA ayahResponseA;
  final List<Ayah> ar;
  final List<Ayah> id;
  const SurahDetailLoaded(this.ayahResponseA, this.ar, this.id);

  @override
  List<Object?> get props => [ayahResponseA, ar, id];
}

class SurahDetailError extends SurahDetailState {
  final String message;

  const SurahDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
