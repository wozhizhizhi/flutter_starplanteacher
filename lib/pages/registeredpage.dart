import 'package:flutter/material.dart';

class RegisteredPage extends StatefulWidget {
  @override
  _RegisteredPageState createState() => new _RegisteredPageState();
}

class _RegisteredPageState extends State<RegisteredPage> {
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
            onPressed: null,
            child: new Text("获取验证码"),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
            ),
            disabledTextColor: Colors.blue,
            disabledColor: Colors.yellowAccent,
          ),
        )
      ],
    );
  }
}
