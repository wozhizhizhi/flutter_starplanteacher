import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:crypto/crypto.dart';

class TabReadHubPage extends StatefulWidget {
  @override
  _TabReadHubPageState createState() => _TabReadHubPageState();
}

class _TabReadHubPageState extends State<TabReadHubPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
//  var tabs = ["同城", "相亲", "广场", "热门"];
  final List<Tab> myTabs = <Tab>[
    new Tab(text: '广场'),
    new Tab(text: '同校'),
    new Tab(text: '我的班级'),
    new Tab(text: '我的'),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              expandedHeight: 250.0,
              elevation: 1.0,
              pinned: true,
              title: new Text(
                "悦读圈",
                style: new TextStyle(color: Colors.black87),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              flexibleSpace: new FlexibleSpaceBar(
                background: new Container(
                    padding: const EdgeInsets.only(top: 75.0),
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Text("热门话题"),
                              alignment: Alignment.center,
                            ),
                            new Container(
                              padding: const EdgeInsets.only(right: 10.0),
                              alignment: Alignment.center,
                              child: new Image.asset(
                                "images/img_userinfo_jump.png",
                                width: 12.0,
                                height: 12.0,
                              ),
                            ),
                          ],
                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: new LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints viewportConstraints) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: viewportConstraints.minWidth,
                                  ),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: List.generate(10, (i){
                                      return _buildImage();
                                    }),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
              actions: <Widget>[
                new Image.asset(
                  "images/quan_icon_post.png",
                  width: 40.0,
                  height: 40.0,
                ),
              ],
            ),
            new SliverPersistentHeader(
                pinned: true,
                delegate: new _SliverAppBarDelegate(new TabBar(
                  tabs: myTabs,
                  labelColor: const Color(0xff22b2e1),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color(0xff22b2e1),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  controller: _tabController,
                ))),
          ];
        },
        body: new TabBarView(
          controller: _tabController,
          children: myTabs.map((Tab tab) {
            return new Center(child: new Text(tab.text));
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Image.asset(
          "images/home_img_bg.png",
          width: 141.0,
          height: 111.0,
          fit: BoxFit.fill,
        ),
        new Container(padding: const EdgeInsets.only(top: 7.0),
          child: new Text(
            "# 一起玩转Washing Line #",
            style: new TextStyle(color: const Color(0xff484848),fontSize: 13.0),
          ),
        )
      ],
    );
  }

  Widget _buildListItem(){
    return new Column();

  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
