import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_subs/data/repo/kitchen_repo.dart';
import 'package:food_subs/data/models/kitchen_model.dart';
import 'package:food_subs/data/models/home_banner_model.dart';
import 'package:food_subs/data/models/top_kitchen_model.dart';

part 'kitchen_event.dart';
part 'kitchen_state.dart';

class KitchenBloc extends Bloc<KitchenEvent, KitchenState> {
  final Repository repository;

  KitchenBloc(apiService, {required this.repository})
      : super(KitchenInitial()) {
    on<FetchKitchens>(_onFetchKitchens);
  }

  void _onFetchKitchens(FetchKitchens event, Emitter<KitchenState> emit) async {
    emit(KitchenLoading());

    try {
      final kitchens = await repository.fetchKitchens();
      List<KitchenModel> kitchenList = List<KitchenModel>.from(
          kitchens.map((x) => KitchenModel.fromJson(x)));

      final topKitchens = await repository.fetchTopKitchens();
      List<TopKitchenModel> topKitchenList = List<TopKitchenModel>.from(
          topKitchens.map((x) => TopKitchenModel.fromJson(x)));
      final banner = await repository.fetchHomeBanner();
      emit(KitchenLoaded(kitchenList, topKitchenList, banner));
    } catch (e) {
      emit(KitchenError(e.toString()));
    }
  }
}
