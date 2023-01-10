part of 'nearme_bloc.dart';

abstract class NearmeState extends Equatable {
  const NearmeState();

  @override
  List<Object?> get props => [];
}

class NearmeEmpty extends NearmeState {
  const NearmeEmpty();

  @override
  List<Object?> get props => [];
}

class NearmeLoading extends NearmeState {}

class NearmeLoaded extends NearmeState {
  final List<Nearme> nearmeList;

  const NearmeLoaded(this.nearmeList);

  @override
  List<Object?> get props => [nearmeList];
}

class NearmeError extends NearmeState {
  final String message;

  const NearmeError(this.message);

  @override
  List<Object?> get props => [message];
}
