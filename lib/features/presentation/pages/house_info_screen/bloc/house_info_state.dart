part of 'house_info_bloc.dart';

abstract class HouseInfoState extends Equatable {
  const HouseInfoState();

  @override
  List<Object> get props => [];
}

class HouseInfoInitial extends HouseInfoState {}

class HouseInfoLoadingState extends HouseInfoState {}

class HouseInfoLoadedState extends HouseInfoState {
  final HouseInfoModel model;

  const HouseInfoLoadedState({required this.model});
}

class HouseInfoErrorState extends HouseInfoState {}
