import 'package:flutter_starplanforparents/net/apis.dart';
import 'dart:async';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'package:flutter_starplanforparents/modle/loginvo.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter_starplanforparents/net/fecth.dart';
import 'package:flutter_starplanforparents/strings/string.dart';
import 'package:flutter/foundation.dart'; //一个用于识别操作系统的工具库，其内的defaultTargetPlatform值可帮助我们识别操作系统

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
      Map parame ={
        "account": account,
        "password": md5.convert(utf8.encode(realPassword+Strings.MD5_T_MARK)),
        "loginType": loginType,
        "realPassword": realPassword,
        "uniqueId": uniqueId,
        "phoneMark": phoneMark,
        "systemMark": systemMark,
        "platForm": defaultTargetPlatform == TargetPlatform.android?1:2,
        "version": version,
        "token": token,
        "time": new DateTime.now().millisecondsSinceEpoch,
      };
//      806933fb23210ac6bbf1892097a100c8
      print(md5.convert(utf8.encode(realPassword+Strings.MD5_T_MARK)));
      print("请求参数: "+ parame.toString());
      response = await dio.post(url, data: parame);
      print(url);
      print("response-+++ ${response.data}");
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
