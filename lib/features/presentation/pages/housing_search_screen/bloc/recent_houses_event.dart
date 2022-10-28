part of 'recent_houses_bloc.dart';

abstract class RecentHousesEvent extends Equatable {
  const RecentHousesEvent();

  @override
  List<Object> get props => [];
}

class GetRecentHousesEvent extends RecentHousesEvent {}
