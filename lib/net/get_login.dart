import 'package:flutter_starplanforparents/net/apis.dart';
import 'dart:async';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'package:flutter_starplanforparents/modle/loginvo.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter_starplanforparents/net/fecth.dart';

class getLogin {
  Future<BaseModel<LoginVo>> getLoginData(
      String account,
      String realPassword,
      int loginType,
      String uniqueId,
      String phoneMark,
      String systemMark,
      int version,
      String token,
      ) async {
    int code;
    String errorMsg;
    Response response;
    Dio dio = Fecth.getInstance().getDio();
    BaseModel<LoginVo> model;
    LoginVo loginVo;
    String url = Apis.BASE_URL + Apis.URL_LOGIN;

    try {
      print(url);
      print(systemMark);
      print(account);
      print(phoneMark);
//      806933fb23210ac6bbf1892097a100c8
      print(md5.convert(UTF8.encode(realPassword)));
      response = await dio.post(url, data: {
        "account": account,
        "password": "806933fb23210ac6bbf1892097a100c8",
        "loginType": loginType,
        "realPassword": realPassword,
        "uniqueId": uniqueId,
        "phoneMark": phoneMark,
        "systemMark": systemMark,
        "platForm": 1,
        "version": version,
        "token": token,
        "time": new DateTime.now().millisecondsSinceEpoch,
      });
      print(url);
      print("response-+++ $response");
      code = response.statusCode;
      if (code == HttpStatus.OK) {
        print(response.data['statusMsg']);
        errorMsg = response.data['statusMsg'];
        code = response.data['statusCode'];
        loginVo = LoginVo.fromJson(response.data);
//        print(loginVo);
      } else {
        errorMsg = '服务器异常';
      }
    } catch (e) {
      errorMsg = '您的网络似乎出了什么问题';
    } finally {
      model =
          new BaseModel(statusCode: code, statusMsg: errorMsg, data: loginVo);
    }
    return model;
  }
}
