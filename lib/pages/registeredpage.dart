import 'package:flutter/material.dart';
import 'dart:async';

class RegisteredPage extends StatefulWidget {
  @override
  _RegisteredPageState createState() => new _RegisteredPageState();
}

class _RegisteredPageState extends State<RegisteredPage> {
  int _seconds = 0;
  String _verifyStr  = "获取验证码";
  /// 定时器Timer
  Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    /// 页面销毁的时候,清除timer
    _cancleTimer();

  }

  /// 倒计时
  _startTimer() {
    _seconds = 10;

    _timer = Timer.periodic(new Duration(seconds: 1), (timer){
      if(_seconds == 0){
        _cancleTimer();
        return;
      }
      _seconds--;
      _verifyStr = "${_seconds}s";
      if (_seconds == 0){
        _verifyStr = "重新发送";
      }
      setState(() {});
    });
  }

  _cancleTimer(){
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: new Color(0xff22b2e1),
        child: new ListView(
          children: <Widget>[
            _buildTitle(),
            _buildTextEdit(),
            new Container(
              height: 50.0,
              margin: const EdgeInsets.only(top: 80.0, right: 35.0, left: 35.0),
              child: new RaisedButton(
                onPressed: null,
                child: new Text(
                  "提交",
                  style: new TextStyle(fontSize: 18.0),
                ),
                disabledTextColor: Colors.blue,
                disabledColor: Colors.yellowAccent,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return new Container(
      width: 600.0,
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            child: new Image.asset(
              "images/btn_back_yellow.png",
              width: 35.0,
              height: 35.0,
            ),
            onTap: ()=>Navigator.of(context).pop(),
          ),
          new Container(
            padding: const EdgeInsets.only(left: 85.0),
            child: new Text(
              "设置您的密码",
              style: new TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextEdit() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          alignment: Alignment.center,
          height: 40.0,
          margin: const EdgeInsets.only(top: 90.0, left: 35.0, right: 35.0),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              new Radius.circular(10.0),
            ),
          ),
          child: new Container(
            padding: const EdgeInsets.only(left: 10.0),
            child: new TextField(
              decoration: new InputDecoration.collapsed(hintText: "手机号码"),
              style: new TextStyle(fontSize: 15.0),
            ),
          ),
        ),
        _buildTextEditCenter(),
        new Container(
          alignment: Alignment.center,
          height: 40.0,
          margin: const EdgeInsets.only(top: 15.0, left: 35.0, right: 35.0),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              new Radius.circular(10.0),
            ),
          ),
          child: new Container(
            padding: const EdgeInsets.only(left: 10.0),
            child: new TextField(
              decoration: new InputDecoration.collapsed(hintText: "设置您的密码"),
              style: new TextStyle(fontSize: 15.0),
            ),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(left: 55.0, top: 10.0),
          child: new Text(
            "*密码字数不小于6位",
            style: new TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildTextEditCenter() {
    return new Row(
      children: <Widget>[
        new Container(
          alignment: Alignment.center,
          height: 40.0,
          width: 155.0,
          margin: const EdgeInsets.only(
            top: 15.0,
            left: 35.0,
          ),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              new Radius.circular(10.0),
            ),
          ),
          child: new Container(
            padding: const EdgeInsets.only(left: 10.0),
            child: new TextField(
              decoration: new InputDecoration.collapsed(hintText: "验证码"),
              style: new TextStyle(fontSize: 15.0),
            ),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 15.0, left: 15.0),
          child: new RaisedButton(
            /// 触发定时任务
            onPressed: (_seconds == 0)?(){
              _startTimer();
            }:null,
            child: new Text(_verifyStr),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
            ),
            textColor: Colors.blue,
            color: Colors.yellowAccent,
            disabledColor: Colors.yellowAccent,
            disabledTextColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
