import 'package:dio/dio.dart';
import 'package:kars_avia/features/data/datasourses/remote/catch_exception.dart';

class ApiRequester {
  static String url = "http://site8.web-sites-dev.online/api/app/";
  // static String url = "https://virtserver.swaggerhub.com/ramaha1565/KarsAvia/0.0.1/";

  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 10000,
        connectTimeout: 10000,
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: param);
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, data: param);
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
