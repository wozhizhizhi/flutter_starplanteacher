import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/pages/tab_guidance_page.dart';
import 'package:flutter_starplanforparents/pages/tab_book_page.dart';
import 'package:flutter_starplanforparents/pages/tab_readershub_page.dart';
import 'package:flutter_starplanforparents/pages/tab_my_page.dart';
import 'package:flutter/cupertino.dart'; //IOS的控件
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabTitle = ["指导", "图书", "悦读圈", "我"];
  // 选中与未选中的文字效果
  final textTabStyleNormal = new TextStyle(color: const Color(0xffc7c7c7));
  final textTabStyleSelected = new TextStyle(color: const Color(0xff22b2e1));
  var _body;
  int _curIndex = 0;
  var tabImages;
  int lastClickTime = 0;

  // 双击退出应用
  Future<bool> _doExitApp() {
    int nowTime = new DateTime.now().millisecondsSinceEpoch;
    if (nowTime - lastClickTime < 2000) {
      return new Future.value(true);
    } else {
      lastClickTime = new DateTime.now().millisecondsSinceEpoch;
      return new Future.value(false);
    }
  }

  void _initPage() {
    _body = new IndexedStack(
      children: <Widget>[
        new TabGuidancePage(),
        new TabBookPage(),
        new TabReadHubPage(),
        new TabMyPage(),
      ],
      index: _curIndex,
    );
  }

  Image getTabImage(path) {
    return new Image.asset(
      path,
      width: 25.0,
      height: 25.0,
    );
  }

  // 初始化底部tab的图片0未选中,1选中
  void _initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage("images/img_tab_guide_normal.png"),
          getTabImage("images/img_tab_guide.png")
        ],
        [
          getTabImage("images/img_tab_library_normal.png"),
          getTabImage("images/img_tab_library.png")
        ],
        [
          getTabImage("images/bar_icon_reading_circle.png"),
          getTabImage("images/bar_icon_reading_circle2.png")
        ],
        [
          getTabImage("images/img_tab_userinfo_normal.png"),
          getTabImage("images/img_tab_userinfo.png")
        ],
      ];
    }
  }

  // 文字选中的字体样式
  TextStyle _selectTextStyle(int index) {
    if (index == _curIndex) {
      return textTabStyleSelected;
    }
    return textTabStyleNormal;
  }

  // 选中与未选中的图片
  Image selectImage(int index) {
    if (index == _curIndex) {
      return tabImages[index][1];
    }
    return tabImages[index][0];
  }

  Text _selectText(int index) {
    return new Text(
      tabTitle[index],
      style: _selectTextStyle(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    _initPage();
    return new WillPopScope(
      child: new Scaffold(
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: selectImage(0), title: _selectText(0)),
            new BottomNavigationBarItem(
                icon: selectImage(1), title: _selectText(1)),
            new BottomNavigationBarItem(
                icon: selectImage(2), title: _selectText(2)),
            new BottomNavigationBarItem(
                icon: selectImage(3), title: _selectText(3)),
          ],
          currentIndex: _curIndex,
          onTap: (index) {
            setState(() {
              _curIndex = index;
            });
          },
        ),
      ),
      onWillPop: _doExitApp,
    );
  }
}
