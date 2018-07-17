import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'package:flutter_starplanforparents/modle/homevo.dart';
import 'dart:async';
import 'package:flutter_starplanforparents/strings/string.dart';
import 'package:flutter_starplanforparents/net/netutil.dart';
import 'package:flutter_starplanforparents/widget/commonloading.dart';

class TabGuidancePage extends StatefulWidget {
  @override
  _TabGuidancePageState createState() => _TabGuidancePageState();
}

class _TabGuidancePageState extends State<TabGuidancePage> {
  BaseModel<List<HomeVo>> model = new BaseModel<List<HomeVo>>();
  List<HomeVo> listvo = new List<HomeVo>();
  List<HomeListVo> homelistvo = new List<HomeListVo>();
//  NetUtil netUtil;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Future<Null> _getData() async {
    if (!mounted) return; //异步处理，防止报错
    BaseModel<List<HomeVo>> models = await NetUtil.getInstance().getHomeData();
    setState(() {
      model = models;
    });

    if (model.data.isNotEmpty) {
      listvo = model.data;
    }
  }

  @override
  Widget build(BuildContext context) {
    var content;
    if (listvo.isEmpty){
      content = new CommonLoading();
    }
    else{
      content = _buildBody(context);
    }
    return new Scaffold(
        body: content,
    );
  }

  // listview的子项
  Widget _buildItem(int index) {
    List homelistvos = listvo[index].listVoArr;
    homelistvo = homelistvos.map((homelistvo) {
      return HomeListVo.fromJson(homelistvo);
    }).toList();

    // new Container()被我换成了card会有一种立体效果
//    print(homelistvo);
//    print("homelistvo[index].coverUrl: ${homelistvo[index].coverUrl}");
//    print(homelistvo[index].title);
//    print(homelistvo[index].subTitle);
//    int ine = index;
//    print(ine);
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
                  " 班级主题阅读活动",
                  style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: new Text(
                  "讲述的是海边上有三个聪明伶俐、心地善良",
                  style: new TextStyle(
                    color: const Color(0xff9a9a9a),
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
                            color: const Color(0xff9a9a9a), fontSize: 15.0),
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(left: 65.0),
                      child: new Text(
                        "待检测0",
                        style: new TextStyle(
                            color: const Color(0xff9a9a9a), fontSize: 15.0),
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
    return new Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: ExactAssetImage("images/home_img_bg.png"),
              fit: BoxFit.fill)),
      child: new CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
           new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return _buidHeader();
            }, childCount: 1)),

          new SliverSafeArea(
            sliver: new SliverList(
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _buildItem(index);
              }, childCount: model.data.length),
            ),
//            new ListView.builder(
//              itemBuilder: (BuildContext context, int index) {
//                return _buildItem(index);
//              },
//              itemCount: model.data.length,
//            ),
          ),
        ],
      ),
//      children: <Widget>[
//        new Container(
//            child: new Image.asset(
//          "images/home_img_bg.png",
//          fit: BoxFit.fill,
//          width: 500.0,
//          height: 900.0,
//        )),
//
//        new ListView.builder(itemBuilder:  (BuildContext context, int index) {
//          return _buildItem(index);
//        },itemCount: model.data.length,),
//      ],
    );
  }
}
