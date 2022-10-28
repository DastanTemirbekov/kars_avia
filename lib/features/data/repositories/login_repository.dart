/* External dependencies */
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/datasourses/remote/api_requester.dart';
import 'package:kars_avia/features/data/datasourses/remote/catch_exception.dart';
import 'package:kars_avia/features/data/models/confirm_code_model.dart';
import 'package:kars_avia/features/data/models/login_model.dart';

class LoginRepository {
  var box = Hive.box('tokenBox');

  Future<LoginModel> login({int? phoneNumber}) async {
    try {
      ApiRequester requester = ApiRequester();

      Response response = await requester.toPost(
        "login/auth",
        param: {'phone': phoneNumber},
      );

      log('login response === $response');

      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(response.data);

        box.put(
          'login_token',
          '${response.data['confirm_token']}',
        );

        print('login token from Hive === ${box.get('login_token')}');
        return loginModel;
      }

      throw CatchException.convertException(response);
    } catch (e) {
      log('loginError === $e');
      throw CatchException.convertException(e);
    }
  }

  Future<ConfirmCodeModel> confirmCode({int? code, String? token}) async {
    String token = await box.get('login_token', defaultValue: '');

    try {
      ApiRequester requester = ApiRequester();
      print('код: $code');

      Response response = await requester.toPost(
        "login/confirm",
        param: {
          'code': code,
          'token': token,
        },
      );

      log('confirm code response === $response');

      if (response.statusCode == 200) {
        ConfirmCodeModel confirmCodeModel =
            ConfirmCodeModel.fromJson(response.data);

        box.put(
          'token',
          '${response.data['token']}',
        );

        print('token from Hive === ${box.get('token')}'); //для проверки сохранился ли в кэше

        return confirmCodeModel;
      }

      throw CatchException.convertException(response);
    } catch (e) {
      log('confirmCodeError === $e');
      throw CatchException.convertException(e);
    }
  }
}
