part of 'kitchen_bloc.dart';

sealed class KitchenState extends Equatable {
  const KitchenState();

  @override
  List<Object> get props => [];
}

final class KitchenInitial extends KitchenState {}

class KitchenLoading extends KitchenState {}

class KitchenLoaded extends KitchenState {
  final List<KitchenModel> kitchens;
  final List<TopKitchenModel> topKitchens;
  final HomeBannerModel banner;

  const KitchenLoaded(this.kitchens, this.topKitchens, this.banner);
  @override
  List<Object> get props => [kitchens, topKitchens, banner];
}

class KitchenError extends KitchenState {
  final String message;

  const KitchenError(this.message);
}
