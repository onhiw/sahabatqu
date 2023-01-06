part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {}

class FetchAllCity extends CityEvent {
  @override
  List<Object?> get props => [];
}
