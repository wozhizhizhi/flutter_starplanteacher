import 'package:dio/dio.dart';
import 'package:flutter_starplanforparents/net/apis.dart';

class DioFactory {
  static Dio _dio;

  static DioFactory _instance;

  static DioFactory getInstance() {
    if (_instance == null) {
      _instance = new DioFactory._();
      _instance._init();
    }
    return _instance;
  }

  DioFactory._();

  _init() {
    _dio = new Dio(new Options(
      baseUrl: Apis.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      // 5s
      // headers: {
      //   "uniqueId": "865166024344338",
      //   "phoneMark": "sm-g610f",
      //   "time": "1530775715602",
      //   "token": "51d68346dd2e4eea881181585907b835",
      //   "systemMark": "22",
      //   "platForm": "1",
      //   "version": "202014",
      // },
    ));
  }

  getDio() {
    return _dio;
  }
}
