import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/net/get_home_data.dart';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'package:flutter_starplanforparents/modle/homevo.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_starplanforparents/strings/string.dart';

class TabGuidancePage extends StatefulWidget {
  @override
  _TabGuidancePageState createState() => _TabGuidancePageState();
}

class _TabGuidancePageState extends State<TabGuidancePage> {
  BaseModel<HomeVo> model;
  GetHomeData getHomeData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeData = new GetHomeData();
//    getData();
  }

  Future<Null> getData() async {
    var home = await getHomeData.getStoryExtra();
    setState(() {
      model = home;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  // listview的子项
  Widget _buildItem() {
    // new Container()被我换成了card会有一种立体效果
    return new Card(
//      decoration: new BoxDecoration(
//        color: Colors.white,
//        borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
//      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Image.asset("images/img_capabilitytraining.png"),
            width: 60.0,
            height: 60.0,
            alignment: Alignment.center,
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 12.0),
                child: new Text(
                  "班级阅读基础能力训练",
                  style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: new Text(
                  "紧扣新课标,进阶能力训练,完善的体系",
                  style: new TextStyle(
                    color: new Color(0xff9a9a9a),
                    fontSize: 12.0,
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        "未完成0",
                        style: new TextStyle(
                            color: new Color(0xff9a9a9a), fontSize: 15.0),
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(left: 65.0),
                      child: new Text(
                        "待检测0",
                        style: new TextStyle(
                            color: new Color(0xff9a9a9a), fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 头部布置作业
  Widget _buidHeader() {
    return new Column(
      children: <Widget>[
        new Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 45.0),
          child: new Text(
            Strings.STRING_APP,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
        // 布置的按钮
        new Container(
          padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
          child: new RaisedButton(
            onPressed: null,
            disabledColor: Colors.white30,
            shape: new StadiumBorder(),
            child: new FittedBox(
              child: new Row(
                children: <Widget>[
                  new Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  new Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 30.0),
                    child: new Text(
                      "布置",
                      style: new TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
            child: new Image.asset(
          "images/home_img_bg.png",
          fit: BoxFit.fill,
          width: 500.0,
          height: 900.0,
        )),
        new Column(
          children: <Widget>[
            new Column(
              children: <Widget>[
                _buidHeader(),
                new Container(
                  child: _buildItem(),
                  padding: const EdgeInsets.all(10.0),
                ),
                new Container(
                  child: _buildItem(),
                  padding: const EdgeInsets.all(10.0),
                ),
                new Container(
                  child: _buildItem(),
                  padding: const EdgeInsets.all(10.0),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
