part of 'recent_houses_bloc.dart';

abstract class RecentHousesState extends Equatable {
  const RecentHousesState();

  @override
  List<Object> get props => [];
}

class RecentHousesInitial extends RecentHousesState {}

class RecentHousesLoadingState extends RecentHousesState {}

class RecentHousesLoadedState extends RecentHousesState {
  final List<HousesModel> model;

  const RecentHousesLoadedState({required this.model});
}

class RecentHousesErrorState extends RecentHousesState {}
