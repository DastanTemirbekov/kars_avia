part of 'houses_catalog_bloc.dart';

abstract class HousesCatalogState extends Equatable {
  const HousesCatalogState();

  @override
  List<Object> get props => [];
}

class HousesCatalogInitial extends HousesCatalogState {}

class HousesCatalogLoadingState extends HousesCatalogState {}

class HousesCatalogLoadedState extends HousesCatalogState {
  final List<HousesModel> model;

  const HousesCatalogLoadedState({required this.model});
}

class HousesCatalogErrorState extends HousesCatalogState {}
