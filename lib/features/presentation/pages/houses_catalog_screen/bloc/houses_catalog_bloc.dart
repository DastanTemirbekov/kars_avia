/* External dependencies */
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/models/houses_model.dart';

part 'houses_catalog_event.dart';
part 'houses_catalog_state.dart';

class HousesCatalogBloc extends Bloc<HousesCatalogEvent, HousesCatalogState> {
  HousesCatalogBloc() : super(HousesCatalogInitial()) {
    on<HousesCatalogEvent>((event, emit) async {
      if (event is GetHousesEvent) {
        emit(HousesCatalogLoadingState());

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
              imageUrl: '',
            ),
            HousesModel(
              id: 6,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 123,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 23423,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl: '',
            ),
            HousesModel(
              id: 235,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 243,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 532,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 325,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
            HousesModel(
              id: 523,
              city: 'Москва',
              name: 'Moscow Park Inn',
              description: 'Одноместный Suite',
              imageUrl:
                  'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ),
          ];

          emit(HousesCatalogLoadedState(model: housesModelList));
        } catch (e) {}
      }
    });
  }
}
