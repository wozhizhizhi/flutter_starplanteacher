import 'package:shared_preferences/shared_preferences.dart';

class SharedPreUtil{
  static save(String key,dynamic value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (dynamic == String){
      sharedPreferences.setString(key, value);
    }
    else if(dynamic == int){
      sharedPreferences.setInt(key, value);
    }
    else if(dynamic == bool){
      sharedPreferences.setBool(key, value);
    }
    else if(dynamic == double){
      sharedPreferences.setDouble(key, value);
    }
    else if(dynamic == List){
      sharedPreferences.setStringList(key, value);
    }

  }

  static dynamic getValue(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  static romve(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  static romveAll() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}