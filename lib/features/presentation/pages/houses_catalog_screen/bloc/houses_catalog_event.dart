part of 'houses_catalog_bloc.dart';

abstract class HousesCatalogEvent extends Equatable {
  const HousesCatalogEvent();

  @override
  List<Object> get props => [];
}

class GetHousesEvent extends HousesCatalogEvent {}
