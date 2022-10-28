import 'package:dio/dio.dart';

class CatchException {
  String? message;

  CatchException({this.message});

  static CatchException convertException(dynamic error) {
    if (error is DioError && error.error is CatchException) {
      return error.error;
    }

    if (error is DioError) {
      print(error);
      if (error.type == DioErrorType.connectTimeout) {
        print('CONNECTION_ERROR');
        return CatchException(
            message: 'Превышено время обработки запроса. Повторите позднее');
      } else if (error.type == DioErrorType.receiveTimeout) {
        print('RECIVE_ERROR');
        return CatchException(
            message: 'Превышено время обработки запроса. Повторите позднее');
      } else if (error.response == null) {
        print('NO_INTERNET');
        return CatchException(message: 'Нет интернет соеденения');
      } else if (error.response!.statusCode == 401) {
        print('401 - AUTH ERROR');
        return CatchException(message: 'Ошибка обновления токена');
      } else if (error.response!.statusCode == 400) {
        print('400 - AUTH ERROR');
        return CatchException(
            message: convertError(error.response?.data["code"]));
      } else if (error.response!.statusCode == 409) {
        return CatchException(message: error.response!.data["message"]);
      } else {
        return CatchException(message: 'Произошла системаная ошибка');
      }
    }

    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: 'Произошла системаная ошибка');
    }
  }
}

convertError(String error) {
  switch (error) {
    case 'not_exist':
      return 'Пользователь не найден.';

    case "error_data_code":
      return 'Неверный код.';

    case "error_data_token":
      return 'Неверный токен.';

    case "validation_error":
      return 'Неправильный формат кода.';

    case "time_expired":
      return 'Истекло время подтверждения кода.';

    case "time_not_expired":
      return 'Время ожидания для повторной отправки кода ещё не истекло.';

    case "error_send_sms":
      return 'Ошибка отправки смс.';

    default:
      return 'Системная ошибка.';
  }
}
