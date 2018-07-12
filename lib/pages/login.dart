import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/net/get_login.dart';
import 'dart:async';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'package:flutter_starplanforparents/modle/loginvo.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const platformMethodChannel = const MethodChannel(
      "com.shinyread.starplan.parent.flutterstarplanforparents/getDevice");
  getLogin logintum;
  BaseModel<LoginVo> model;
  String uuid;
  int version = 0;
  String systemMark;
  String phoneMark;
  TextEditingController _usetNameEditingController =
      new TextEditingController();
  TextEditingController _passWordEditingController =
      new TextEditingController();

  //通过本地获取系统的UUID
  Future<Null> _getUuid() async {
    String uid;
    try {
      uid = await platformMethodChannel.invokeMethod("getUuid");
    } on PlatformException catch (e) {
      print(e.message);
    }

    setState(() {
      uuid = uid;
    });
  }

  //通过本地获取系统的版本号
  Future<Null> _getVersion() async {
    int vs;
    try {
      vs = await platformMethodChannel.invokeMethod("getVersion");
    } on PlatformException catch (e) {
      print(e.message);
    }

    setState(() {
      version = vs;
    });
  }

  //通过本地获取系统的SDK
  Future<Null> _getsystemMark() async {
    String vs;
    try {
      vs = await platformMethodChannel.invokeMethod("getsystemMark");
    } on PlatformException catch (e) {
      print(e.message);
    }

    setState(() {
      systemMark = vs;
    });
  }

  //通过本地获取系统的phoneMark
  Future<Null> _getphoneMark() async {
    String vs;
    try {
      vs = await platformMethodChannel.invokeMethod("getphoneMark");
    } on PlatformException catch (e) {
      print(e.message);
    }

    setState(() {
      phoneMark = vs;
    });
  }

  Widget buildLogin() {
    return new Column(
      children: <Widget>[
        new Container(
          child: new Image.asset(
            "images/login_logo.png",
            width: 120.0,
            height: 120.0,
          ),
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 80.0),
        ),
        new Container(
          width: 300.0,
          margin: const EdgeInsets.only(top: 18.0),
          child: new Column(
            children: <Widget>[
              new Container(
                child: new TextField(
                  controller: _usetNameEditingController,
                  decoration: new InputDecoration.collapsed(
                    hintText: "请输入手机号码",
                    hintStyle: new TextStyle(fontSize: 15.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
              ),
              new Padding(
                child: new Divider(),
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              ),
              new Container(
                child: new TextField(
                  controller: _passWordEditingController,
                  decoration: new InputDecoration.collapsed(
                    hintText: "请输入密码",
                    hintStyle: new TextStyle(fontSize: 15.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
              ),
            ],
          ),
          // 装饰设置外围的圆角,里面为白色
          decoration: new BoxDecoration(
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
              color: Colors.white),
        ),
        new Container(
          child: new Text(
            "忘记密码",
            style: new TextStyle(color: Colors.white),
          ),
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.only(right: 35.0, top: 10.0),
        ),
        new FittedBox(
          child: new Container(
            width: 250.0,
            height: 70.0,
            padding: const EdgeInsets.only(top: 30.0),
            child: new RaisedButton(
                onPressed: () {
                  if (_usetNameEditingController.value.text.toString().trim() !=
                          "" &&
                      _passWordEditingController.value.text.toString().trim() !=
                          "") {
                    String account = _usetNameEditingController.value.text;
                    String passWord = _passWordEditingController.value.text;
                    _getLoginData(account, passWord);
                  } else {
                    // 这样写有问题！可以在最外层new Builder
//                    Scaffold.of(context).showSnackBar(
//                          new SnackBar(
//                            content: new Text("请先输入账号或者密码"),
//                          ),
//                        );
                  }
                },
                child: new Text(
                    "登录",
                    style: new TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.blue),
                  ),
                color: Colors.yellow,
                shape: new StadiumBorder(),
              ),
          ),
        ),
        new Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(top: 100.0),
          child: new OutlineButton(
            onPressed: null,
            child: new Text(
              "出来报到?注册请戳这里",
              style: new TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            highlightElevation: 5.0,
            shape: new StadiumBorder(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logintum = new getLogin();
//    _getData();
  }

  // 登录请求接口
  Future<Null> _getLoginData(String account, String realPassword) async {
    await _getUuid();
    await _getVersion();
    await _getphoneMark();
    await _getsystemMark();

    print(uuid);
    print(phoneMark);
    print(systemMark);
    print(version);
    BaseModel<LoginVo> model = await logintum.getLoginData(
        account, realPassword, 2, uuid, phoneMark, systemMark, version, null);
    print("modle++++${model.data.token}");
    if (model.data != null) {
      String token = model.data.token;
      if (token != null && token != "") {
        Navigator.pushReplacementNamed(context, "/HomePage");
      }
    }

    setState(() {
      model = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
//          new FittedBox(
//            child: new Image.asset("images/img_record_bg.png"),
//          )
          new Container(
            color: Color(0xff168acc),
          ),
          buildLogin(),
        ],
      ),
    );
  }
}
