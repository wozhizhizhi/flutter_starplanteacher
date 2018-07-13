import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/net/netutil.dart';
import 'dart:async';
import 'package:flutter_starplanforparents/modle/booklistvo.dart';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'package:flutter_starplanforparents/widget/commonloading.dart';

class RecommendTabPage extends StatefulWidget {
  @override
  _RecommendTabPageState createState() => new _RecommendTabPageState();
}

class _RecommendTabPageState extends State<RecommendTabPage> {
  BaseModel<List<BookListVo>> model;
  NetUtil netUtil;

  Future<Null> _getData() async {
    BaseModel<List<BookListVo>> models = await netUtil.getBookListData();
    setState(() {
      model = models;
      print("modle$model");
    });
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = new BaseModel<List<BookListVo>>();
    netUtil = new NetUtil();
    _getData();
  }

  // 构建列表的子项
  Widget _buidItem(int index) {
    String url = model.data[index].coverUrl;
    int data = model.data.length;
    print(data);
    return new FittedBox(fit: BoxFit.none,child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Card(
          child: new Image.network(model.data[index].coverUrl),
        ),
        new Container(
          child: new Text(
            model.data[index].name,
            maxLines: 2,
            style: new TextStyle(fontSize: 24.0),
          ),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Image.asset("images/rp_thunder.png"),
              new Text(" x ${model.data[index].difficultyIndex}"),
            ],
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    var content;
    if (model.data.isEmpty) {
      content = new CommonLoading();
    } else {
      content = // 显示的列表
      new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.0),
        itemBuilder: (context, index)=>_buidItem(index),
        itemCount: model.data.length,
        scrollDirection: Axis.vertical,
      );
//      content = new Column(
//        children: <Widget>[
//          new Container(
//            child: new Text(
//              "热门图书",
//              style: new TextStyle(
//                fontSize: 14.0,
//                color: const Color(0xff484848),
//              ),
//            ),
//            padding: const EdgeInsets.all(13.0),
//          ),
//
//          // 显示的列表
//          new GridView.builder(
//            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 3,
//                mainAxisSpacing: 10.0,
//                crossAxisSpacing: 10.0,
//                childAspectRatio: 1.0),
//            itemBuilder: (context, index)=>_buidItem(index),
//            itemCount: model.data.length,
//            scrollDirection: Axis.vertical,
//          ),
//        ],
//      );
    }
    return new Scaffold(
      body: new RefreshIndicator(
        child: content,
        onRefresh: _getData,
      ),
    );
  }
}
