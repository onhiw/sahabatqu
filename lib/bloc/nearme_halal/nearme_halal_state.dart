part of 'nearme_halal_bloc.dart';

@immutable
abstract class NearmeHalalState {
  const NearmeHalalState();
}

class NearmeHalalInitial extends NearmeHalalState {
  const NearmeHalalInitial();
  @override
  List<Object> get props => [];
}

class NearmeHalalLoading extends NearmeHalalState {
  const NearmeHalalLoading();
  @override
  List<Object> get props => null;
}

class NearmeHalalLoaded extends NearmeHalalState {
  final NearmeHalalModel nearmeHalalModel;
  const NearmeHalalLoaded(this.nearmeHalalModel);

  @override
  List<Object> get props => [nearmeHalalModel];
}

class NearmeHalalError extends NearmeHalalState {
  final String message;
  const NearmeHalalError(this.message);

  @override
  List<Object> get props => [message];
}
