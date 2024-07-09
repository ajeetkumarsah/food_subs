part of 'kitchen_bloc.dart';

sealed class KitchenEvent extends Equatable {
  const KitchenEvent();

  @override
  List<Object> get props => [];
}

class FetchKitchens extends KitchenEvent {}
