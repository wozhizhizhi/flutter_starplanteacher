import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/pages/recommendtabpage.dart';
import 'package:flutter_starplanforparents/pages/classifytabpage.dart';

class TabBookPage extends StatefulWidget {
  @override
  _TabBookPageState createState() => new _TabBookPageState();
}

class _TabBookPageState extends State<TabBookPage> {
  var tabTile = ["推荐", "分类"];
  // 选中与未选中的文字效果
  final textTabStyleNormal = const Color(0xff22b2e1);
  final textTabStyleSelected = const Color(0xffffffff);
  // 选中与未选中的背景效果
  final bgTabStyleNormal = const Color(0xffffffff);
  final bgTabStyleSelected = const Color(0xff22b2e1);
  int _curIndex = 0;
  var _body;
  PageController pageController;
  void _initPage() {
    _body = new IndexedStack(
      children: <Widget>[
        new RecommendTabPage(),
        new ClassifyTabPage(),
      ],
      index: _curIndex,
    );
  }

  Color setTextColor(int index) {
    if (index == _curIndex) {
      return textTabStyleSelected;
    } else {
      return textTabStyleNormal;
    }
  }

  Color setBgColor(int index) {
    if (index == _curIndex) {
      return bgTabStyleSelected;
    } else {
      return bgTabStyleNormal;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: _curIndex);
  }

  void onPageChance(int page) {
    setState(() {
      this._curIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
//    _initPage();
    return new DefaultTabController(
      initialIndex: _curIndex,
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff22b2e1),
          title: buildTitle(),
//          new Row(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              new OutlineButton(
//                onPressed: null,
//                child: new Text(
//                  tabTile[0],
//                  style: new TextStyle(fontSize: 18.0),
//                ),
//                splashColor: Colors.white,
//                disabledTextColor: Colors.white,
//                highlightColor: Colors.white,
//                shape: new RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.only(
//                  topLeft: Radius.circular(10.0),
//                  bottomLeft: Radius.circular(10.0),
//                )),
//              ),
//              new OutlineButton(
//                onPressed: null,
//                child: new Text(
//                  tabTile[1],
//                  style: new TextStyle(fontSize: 18.0),
//                ),
//                disabledTextColor: Colors.white,
//                shape: new RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.only(
//                        topRight: Radius.circular(10.0),
//                        bottomRight: Radius.circular(10.0))),
//              ),
//            ],
//          ),
        ),
        body: new PageView(
//          key: new PageStorageKey<String>(tabTile[_curIndex]),
//          physics: const PageScrollPhysics(parent: const NeverScrollableScrollPhysics()),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _curIndex = index;
            });
          },
          children: <Widget>[
            new RecommendTabPage(),
            new ClassifyTabPage(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return new Container(
      height: 40.0,
      width: 150.0,
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.white, width: 0.8),
        borderRadius: new BorderRadius.all(
          new Radius.circular(20.0),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: new GestureDetector(
//                onTap: (){
//              setState(() {
//                _curIndex = 0;
//              });
//            },
              child: Container(
                alignment: Alignment.center,
                child: new Text(
                  tabTile[0],
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: setTextColor(0),
                  ),
                ),
                height: 40.0,
                width: 75.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(20.0),
                    bottomLeft: new Radius.circular(20.0),
                  ),
                  color: setBgColor(0),
                ),
              ),
            ),
          ),
          new Expanded(
            child: new GestureDetector(
//                onTap: (){
//              setState(() {
//                _curIndex = 1;
//              });
//            },
              child: Container(
                alignment: Alignment.center,
                child: new Text(
                  tabTile[1],
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: setTextColor(1),
                  ),
                ),
                height: 40.0,
                width: 75.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topRight: new Radius.circular(20.0),
                    bottomRight: new Radius.circular(20.0),
                  ),
                  color: setBgColor(1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
