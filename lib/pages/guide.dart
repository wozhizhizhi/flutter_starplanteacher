import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class guidePage extends StatefulWidget {
  @override
  _guidePageState createState() => new _guidePageState();
}

class _guidePageState extends State<guidePage> with TickerProviderStateMixin {
  Animation<double> doubleAnimation;
  AnimationController animationController;

  double opc = 0.0;
  var images = [
    "images/app_guide_1.png",
    "images/app_guide_2.png",
    "images/app_guide_3.png"
  ];
  TabController _tabController;
  Widget getTabImage(path) {
    return new Container(
      child: new Image.asset(
        path,
        fit: BoxFit.fill,
      ),
    );
  }

//  // 初始化底部tab的图片0未选中,1选中
//  void _initData() {
//    if (images == null) {
//      images = [
//        getTabImage("images/app_guide_1.png"),
//        getTabImage("images/app_guide_2.png"),
//        getTabImage("images/app_guide_3.png"),
//      ];
//    }
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: images.length, vsync: this);
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    doubleAnimation =
        new Tween(begin: 0.0, end: 1.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
//    _initData();
    _getGuideShared();
    if (images != null && images.length > 0) {
      for (var i = 0; i < images.length; i++) {
        if (i == images.length - 1) {
          opc = 1.0;
          items.add(new Stack(
            children: <Widget>[
              new Container(
                child: new Image.asset(
                  images[i],
                  fit: BoxFit.fill,
                ),
              ),
              new Opacity(
                opacity: doubleAnimation.value,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 60.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/Login');
                    },
                    child: new Text(
                      "立即进入",
                      style: new TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    color: const Color(0xff33b5e5),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ));
        } else {
          opc = 0.0;
          items.add(new Container(
            child: new Image.asset(
              images[i],
              fit: BoxFit.fill,
            ),
          ));
        }
      }
    }
    return new Scaffold(
      body: new TabBarView(
        children: items,
        controller: _tabController,
      ),
    );
  }

  _getGuideShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("KEY_GUIDE_ACTIVITY", true);
  }
}
