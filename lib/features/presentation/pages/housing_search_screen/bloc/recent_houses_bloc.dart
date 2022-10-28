/* External dependencies */
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/models/houses_model.dart';

part 'recent_houses_event.dart';
part 'recent_houses_state.dart';

class RecentHousesBloc extends Bloc<RecentHousesEvent, RecentHousesState> {
  RecentHousesBloc() : super(RecentHousesInitial()) {
    on<RecentHousesEvent>((event, emit) async {
      if (event is GetRecentHousesEvent) {
        emit(RecentHousesLoadingState());

        try {
          await Future.delayed(const Duration(seconds: 3), () {});

          List<HousesModel> housesModelList = [
            HousesModel(
              id: 1,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 2,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 3,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 4,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 5,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 6,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl: '',
            ),
          ];

          emit(RecentHousesLoadedState(model: housesModelList));
        } catch (e) {}
      }
    });
  }
}
