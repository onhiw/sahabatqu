part of 'nearme_halal_bloc.dart';

@immutable
abstract class NearmeHalalState {
  const NearmeHalalState();
}

class NearmeHalalInitial extends NearmeHalalState {
  const NearmeHalalInitial();

  List<Object> get props => [];
}

class NearmeHalalLoading extends NearmeHalalState {
  const NearmeHalalLoading();

  List<Object>? get props => null;
}

class NearmeHalalLoaded extends NearmeHalalState {
  final NearmeHalalModel nearmeHalalModel;
  const NearmeHalalLoaded(this.nearmeHalalModel);

  List<Object> get props => [nearmeHalalModel];
}

class NearmeHalalError extends NearmeHalalState {
  final String message;
  const NearmeHalalError(this.message);

  List<Object> get props => [message];
}
