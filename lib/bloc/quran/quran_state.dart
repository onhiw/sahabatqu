part of 'quran_bloc.dart';

@immutable
abstract class QuranState {
  const QuranState();
}

class QuranInitial extends QuranState {
  const QuranInitial();

  List<Object> get props => [];
}

class QuranLoading extends QuranState {
  const QuranLoading();

  List<Object> get props => null;
}

class QuranLoaded extends QuranState {
  final QuranModel quranModel;
  const QuranLoaded(this.quranModel);

  List<Object> get props => [quranModel];
}

class QuranLoadError extends QuranState {
  final String message;
  const QuranLoadError(this.message);

  List<Object> get props => [message];
}
