part of 'nearme_mosque_bloc.dart';

@immutable
abstract class NearmeMosqueState {
  const NearmeMosqueState();
}

class NearmeMosqueInitial extends NearmeMosqueState {
  const NearmeMosqueInitial();

  @override
  List<Object> get props => [];
}

class NearmeMosqueLoading extends NearmeMosqueState {
  const NearmeMosqueLoading();
  @override
  List<Object> get props => null;
}

class NearmeMosqueLoaded extends NearmeMosqueState {
  final NearmeMosqueModel mosqueModel;
  const NearmeMosqueLoaded(this.mosqueModel);

  @override
  List<Object> get props => [mosqueModel];
}

class NearmeMosqueError extends NearmeMosqueState {
  final String message;
  const NearmeMosqueError(this.message);

  @override
  List<Object> get props => [message];
}
