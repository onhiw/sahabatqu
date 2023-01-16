part of 'nearme_mosque_bloc.dart';

abstract class NearmeMosqueState extends Equatable {
  const NearmeMosqueState();

  @override
  List<Object?> get props => [];
}

class NearmeMosqueEmpty extends NearmeMosqueState {
  const NearmeMosqueEmpty();

  @override
  List<Object?> get props => [];
}

class NearmeMosqueInitial extends NearmeMosqueState {
  const NearmeMosqueInitial();

  @override
  List<Object?> get props => [];
}

class NearmeMosqueLoading extends NearmeMosqueState {}

class NearmeMosqueLoaded extends NearmeMosqueState {
  final List<Nearme> nearmeList;

  const NearmeMosqueLoaded(this.nearmeList);

  @override
  List<Object?> get props => [nearmeList];
}

class NearmeMosqueError extends NearmeMosqueState {
  final String message;

  const NearmeMosqueError(this.message);

  @override
  List<Object?> get props => [message];
}
