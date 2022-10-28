/* External dependencies */
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/models/house_info_model.dart';

part 'house_info_event.dart';
part 'house_info_state.dart';

class HouseInfoBloc extends Bloc<HouseInfoEvent, HouseInfoState> {
  HouseInfoBloc() : super(HouseInfoInitial()) {
    on<HouseInfoEvent>((event, emit) async {
      if (event is GetHouseByIDEvent) {
        emit(HouseInfoLoadingState());

        try {
          await Future.delayed(const Duration(seconds: 3), () {});

          HouseInfoModel houseModel = HouseInfoModel(
            id: 1,
            city: 'Москва',
            name: 'Moscow Park Inn',
            houseType: 'Одноместный Suite',
            description:
                'Ambassador Tre Rose — уютный и небольшой, окутанный атмосферой непринужденности, в которой каждый гость почувствует себя комфортно, отель Венеции располагает общими помещениями — холлом, администрацией и баром — отреставрированными умелой рукой венецианского архитектора Карло Скарпа Кроме удобного лифта на верхние этажи ведет великолепная лестница — тоже произведение Скарпа. Тут вас ждут со вкусом оформленные номера с лучшими удобствами — все для приятного отпуска в сердце исторического центра Венеции. На террасе с видом на кампанилу Сан Марко, расположенной на последнем этаже, отведен уголок для желающих выкурить сигарету.',
            imagesUrl: [
              'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
              'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
              'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
              'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
              'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
              'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
              'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
              'https://mebelin.kg/uploads/sets/thumb/1578460969_82048100.jpg',
            ],
            feedbacksList: [
              FeedBackList(
                senderName: 'Иванов Иван Иванович',
                date: '00:12 27.11.2021',
                feedback:
                    'Ambassador Tre Rose — уютный и небольшой, окутанный атмосферой непринужденности, в которой каждый гость почувствует себя комфортно, отель Венеции располагает общими помещениями — холлом, администрацией и баром — отреставрированными умелой рукой венецианского архитектора Карло Скарпа Кроме удобного лифта на верхние этажи ведет великолепная лестница — тоже произведение Скарпа. Тут вас ждут со вкусом оформленные номера с лучшими удобствами — все для приятного отпуска в сердце исторического центра Венеции. На террасе с видом на кампанилу Сан Марко, расположенной на последнем этаже, отведен уголок для желающих выкурить сигарету.',
                cleannessMark: 5,
                foodMark: 4.5,
                matchTheDescriptionMark: 4,
                qualityOfServiceMark: 5,
                locationMark: 3,
              ),
              FeedBackList(
                senderName: 'Петренко Петр Иванович',
                date: '00:10 27.11.2021',
                feedback:
                    'Ambassador Tre Rose — уютный и небольшой, окутанный атмосферой непринужденности, в которой каждый гость почувствует себя комфортно, отель Венеции располагает общими помещениями — холлом, администрацией и баром — отреставрированными умелой рукой венецианского архитектора Карло Скарпа Кроме удобного лифта на верхние этажи ведет великолепная лестница — тоже произведение Скарпа. Тут вас ждут со вкусом оформленные номера с лучшими удобствами — все для приятного отпуска в сердце исторического центра Венеции. На террасе с видом на кампанилу Сан Марко, расположенной на последнем этаже, отведен уголок для желающих выкурить сигарету.',
                cleannessMark: 2,
                foodMark: 1,
                matchTheDescriptionMark: 2,
                qualityOfServiceMark: 1,
                locationMark: 2,
              ),
            ],
          );

          emit(HouseInfoLoadedState(model: houseModel));
        } catch (e) {}
      }
    });
  }
}
