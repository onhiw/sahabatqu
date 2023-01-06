part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class CityEmpty extends CityState {
  const CityEmpty();

  @override
  List<Object> get props => [];
}

class CityLoading extends CityState {}

class CityLoaded extends CityState {
  final List<City> city;

  const CityLoaded(this.city);

  @override
  List<Object> get props => [city];
}

class CityError extends CityState {
  final String message;

  const CityError(this.message);

  @override
  List<Object> get props => [message];
}
