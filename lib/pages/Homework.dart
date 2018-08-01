import 'package:flutter/material.dart';
import 'dart:async';

class HomeWorkPage extends StatefulWidget {
  @override
  _HomeWorkPageState createState() => new _HomeWorkPageState();
}

class _HomeWorkPageState extends State<HomeWorkPage> {
  int lastClickTime = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            _HomeTitle(),
//            _listClass(),
          ],
        ),
      ),
    );
  }

  // 标题
  Widget _HomeTitle() {
    return new Container(
      margin: const EdgeInsets.only(top: 35.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: new Container(
              padding: const EdgeInsets.only(left: 15.0),
              child: new Image.asset(
                "images/btn_back_yellow.png",
                width: 25.0,
                height: 25.0,
              ),
            ),
          ),
          new Container(
            child: new Text(
              "选择班级",
              style: new TextStyle(fontSize: 18.0, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
          new Opacity(
            opacity: 0.0,
            child: new Image.asset(
              "images/btn_back_yellow.png",
              width: 25.0,
              height: 25.0,
            ),
          ),
        ],
      ),
    );
  }

  // 年级选择项
  Widget _listClass() {
    return new Expanded(child: new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
//        new ListView.custom(
//          childrenDelegate: new SliverChildListDelegate(
//            new List.generate(
//                15,
//                (int index) => new ListTile(
//                      title: new Text("${index}年级"),
//                    )),
//          ),
//        ),
//
//        new ListView.custom(
//          childrenDelegate: new SliverChildListDelegate(
//            new List.generate(
//                15,
//                    (int index) => new ListTile(
//                  title: new Text("${index}班"),
//                )),
//          ),
//        ),
      ],
    ),);
  }
}
