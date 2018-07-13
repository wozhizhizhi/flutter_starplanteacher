import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
// WidgetsBindingObserver用于监听生命周期
class _SplashState extends State<Splash> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecyleState;

  Future<Null> _logOut() async {
//    String dir = (await getApplicationDocumentsDirectory()).path;
    await Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
         Navigator.of(context).popAndPushNamed("/HomePage");
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              child: new Image.asset(
                "images/launch.png",
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.fromLTRB(0.0, 45.0, 10.0, 0.0),
              child: OutlineButton(
                child: new Text(
                  "跳过",
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white),
                ),
                // StadiumBorder椭圆的形状
                shape: new StadiumBorder(),
                onPressed: () {
//                  return RouteUtil.routetoHome(context);
//                  _logOut();
                  go2HomePage();

                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    setState(() {
      _lastLifecyleState = state;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    countDown();
  }

  // 倒计时
  void countDown() {
    var _duration = new Duration(seconds: 3);

    new Future.delayed(_duration, go2HomePage);
  }

  void go2HomePage() {
    _getTokenShared();
  }

  // 获取token的本地数据
  _getTokenShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    print('Pressed $token');
    // 有token跳转到首页没有跳转登录页面
    if (token != null && token != ""){
      Navigator.pushReplacementNamed(context , '/HomePage');
    }else{
      Navigator.pushReplacementNamed(context , '/Login');
    }

  }
}
