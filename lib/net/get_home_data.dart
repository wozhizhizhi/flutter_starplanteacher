import 'dart:async';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'package:flutter_starplanforparents/modle/homevo.dart';
import 'package:flutter_starplanforparents/net/apis.dart';
import 'package:flutter_starplanforparents/net/fecth.dart';
import 'package:dio/dio.dart';
import 'dart:io';
class GetHomeData{
  Future<BaseModel<HomeVo>> getStoryExtra() async {
  Dio dio =Fecth.getInstance().getDio();

  String url = Apis.BASE_URL + Apis.URL_HOMEPAGE;

  int code;

  String errorMsg;

  HomeVo storyExtraModel;

  BaseModel<HomeVo> model;

  try {
    Response response = await dio.get(url);

    code = response.statusCode;

    if (response.statusCode == HttpStatus.OK) {
      storyExtraModel = HomeVo.fromJson(response.data);
    } else {
      errorMsg = '服务器异常';
    }
  } catch (exception) {
    errorMsg = '您的网络似乎出了什么问题';
  } finally {
    model =
    new BaseModel(statusCode: code, statusMsg: errorMsg, data: storyExtraModel);
  }

  return model;
}

}