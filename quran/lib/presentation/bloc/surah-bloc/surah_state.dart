part of 'surah_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object?> get props => [];
}

class SurahEmpty extends SurahState {
  const SurahEmpty();

  @override
  List<Object?> get props => [];
}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<Surah> surah;

  const SurahLoaded(this.surah);

  @override
  List<Object?> get props => [surah];
}

class SurahError extends SurahState {
  final String message;

  const SurahError(this.message);

  @override
  List<Object?> get props => [message];
}
