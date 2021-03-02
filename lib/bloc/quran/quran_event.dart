part of 'quran_bloc.dart';

@immutable
abstract class QuranEvent {
  const QuranEvent();
}

class GetQuranList extends QuranEvent {
  @override
  List<Object> get props => null;
}
