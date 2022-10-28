part of 'house_info_bloc.dart';

abstract class HouseInfoEvent extends Equatable {
  const HouseInfoEvent();

  @override
  List<Object> get props => [];
}

class GetHouseByIDEvent extends HouseInfoEvent {
  final int id;

  const GetHouseByIDEvent({required this.id});
}
