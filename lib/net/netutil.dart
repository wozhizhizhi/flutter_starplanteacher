import 'package:flutter_starplanforparents/net/apis.dart';
import 'dart:async';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_starplanforparents/net/fecth.dart';
import 'package:flutter_starplanforparents/modle/booklistvo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_starplanforparents/modle/homevo.dart';

class NetUtil{
  static NetUtil _instance;
  static NetUtil getInstance(){
    if (_instance == null){
      _instance = new NetUtil();
    }
    return _instance;
  }
  NetUtil(){}
  Future<BaseModel<List<BookListVo>>> getBookListData() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String uniqueId = prefs.getString("uuid");
    String phoneMark = prefs.getString("phoneMark");
    String systemMark = prefs.getString("systemMark");
    int version = prefs.getInt("version");
    BaseModel<List<BookListVo>> model;
    List<BookListVo> bookListVos;
    Dio dio = Fecth.getInstance().dio;
    String url = Apis.BASE_URL_NOPORT + Apis.URL_INTEREST_LIBRARY_LISTS;
    Response response;
    int code;
    String errorMsg;

    try {

      print(uniqueId);
      print(phoneMark);
      print(systemMark);
      print(version);
      print(token);
      print(new DateTime.now().millisecondsSinceEpoch);

      response = await dio.get(url, data:{
        "uniqueId": uniqueId,
        "phoneMark": phoneMark,
        "systemMark": systemMark,
        "platForm": 1,
        "version": version,
        "token": token,
        "time": new DateTime.now().millisecondsSinceEpoch,
      });

      print("response-+++ ${response.toString()}");
      code = response.statusCode;
      if (code == HttpStatus.OK) {
        print(response.data['statusMsg']);
        errorMsg = response.data['statusMsg'];
        code = response.data['statusCode'];
        List books = response.data['bookListVoArr'];
        bookListVos = books.map((book){
          return BookListVo.fromJson(book);
        }).toList();
        print(bookListVos);
      } else {
        errorMsg = '服务器异常';
      }
    } catch (e) {
      print(e.toString());
      errorMsg = '您的网络似乎出了什么问题';
    } finally {
      model =
      new BaseModel(statusCode: code, statusMsg: errorMsg, data: bookListVos);
    }
    return model;
  }

  // 获取首页列表的数据
  Future<BaseModel<List<HomeVo>>> getHomeData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    String uniqueId = prefs.getString("uuid");
    String phoneMark = prefs.getString("phoneMark");
    String systemMark = prefs.getString("systemMark");
    int version = prefs.getInt("version");
    BaseModel<List<HomeVo>> model;
    List<HomeVo> list;
    List<HomeListVo> homelistvo;
    Dio dio = Fecth.getInstance().dio;
    String url = Apis.BASE_URL_NOPORT + Apis.URL_HOMEPAGE;
    Response response;
    int code;
    String errorMsg;

    try {
      print(new DateTime.now().millisecondsSinceEpoch);

      response = await dio.get(url, data:{
        "uniqueId": uniqueId,
        "phoneMark": phoneMark,
        "systemMark": systemMark,
        "platForm": 1,
        "version": version,
        "token": token,
        "time": new DateTime.now().millisecondsSinceEpoch,
      });

      print("response-+++ $response");
      code = response.statusCode;
      if (code == HttpStatus.OK) {
        print(response.data['statusMsg']);
        errorMsg = response.data['statusMsg'];
        code = response.data['statusCode'];
        List homevoList = response.data['homeVoArr'];
        list = homevoList.map((homevoList){
          return HomeVo.fromJson(homevoList);
        }).toList();
        print(List);
      } else {
        errorMsg = '服务器异常';
      }
    } catch (e) {
      print(e.toString());
      errorMsg = '您的网络似乎出了什么问题';
    } finally {
      model = new BaseModel(statusCode: code, statusMsg: errorMsg, data: list);
    }
    return model;
  }
}