import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/pages/recommendtabpage.dart';
import 'package:flutter_starplanforparents/pages/classifytabpage.dart';

class TabBookPage extends StatefulWidget {
  @override
  _TabBookPageState createState() => new _TabBookPageState();
}

class _TabBookPageState extends State<TabBookPage> {
  var tabTile = ["推荐", "分类"];
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: _curIndex);
  }

  void onPageChance(int page) {
    setState(() {
      this._curIndex = _curIndex;
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
          title: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new OutlineButton(
                onPressed: null,
                child: new Text(
                  tabTile[0],
                  style: new TextStyle(fontSize: 18.0),
                ),
                splashColor: Colors.white,
                disabledTextColor: Colors.white,
                highlightColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                )),
              ),
              new OutlineButton(
                onPressed: null,
                child: new Text(
                  tabTile[1],
                  style: new TextStyle(fontSize: 18.0),
                ),
                disabledTextColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
              ),
            ],
          ),
        ),
        body: new PageView(key: new PageStorageKey(_curIndex),
//          physics: const PageScrollPhysics(parent: const NeverScrollableScrollPhysics()),
          controller: pageController,
          onPageChanged: onPageChance,
          children: <Widget>[
            new RecommendTabPage(),
            new ClassifyTabPage(),
          ],
        ),
      ),
    );
  }
}
