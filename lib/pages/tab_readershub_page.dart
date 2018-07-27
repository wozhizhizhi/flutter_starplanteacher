import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:crypto/crypto.dart';

class TabReadHubPage extends StatefulWidget {
  @override
  _TabReadHubPageState createState() => _TabReadHubPageState();
}

class _TabReadHubPageState extends State<TabReadHubPage> {
  @override
  Widget build(BuildContext context) {
    var tabs = ["同城", "相亲", "广场", "热门"];
    return Scaffold(
//      appBar: new AppBar(
//        title: new Text(
//          "悦读圈",
//          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//        ),
//        backgroundColor: const Color(0xff22b2e1),
//        centerTitle: true,
//        actions: <Widget>[
//          new Image.asset(
//            "images/quan_icon_post.png",
//            width: 60.0,
//            height: 60.0,
//          )
//        ],
//      ),
      body: new DefaultTabController(
        length: tabs.length, // This is the number of tabs.
        child: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              new SliverOverlapAbsorber(
                // This widget takes the overlapping behavior of the SliverAppBar,
                // and redirects it to the SliverOverlapInjector below. If it is
                // missing, then it is possible for the nested "inner" scroll view
                // below to end up under the SliverAppBar even when the inner
                // scroll view thinks it has not been scrolled.
                // This is not necessary if the "headerSliverBuilder" only builds
                // widgets that do not overlap the next sliver.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: new SliverAppBar(
                  title: new Text(
                    "悦读圈",
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  backgroundColor: const Color(0xff22b2e1),
                  centerTitle: true,
                  actions: <Widget>[
                    new Image.asset(
                      "images/quan_icon_post.png",
                      width: 45.0,
                      height: 45.0,
                    )
                  ], // This is the title in the app bar.
                  pinned: true,
                  expandedHeight: 350.0,
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.
                  forceElevated: innerBoxIsScrolled,
                  bottom: new TabBar(
                    // These are the widgets to put in each tab in the tab bar.
                    tabs:
                        tabs.map((String name) => new Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: new TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: tabs.map((String name) {
              return new SafeArea(
                top: false,
                bottom: false,
                child: new Builder(
                  // This Builder is needed to provide a BuildContext that is "inside"
                  // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
                  // find the NestedScrollView.
                  builder: (BuildContext context) {
                    return new CustomScrollView(
                      // The "controller" and "primary" members should be left
                      // unset, so that the NestedScrollView can control this
                      // inner scroll view.
                      // If the "controller" property is set, then this scroll
                      // view will not be associated with the NestedScrollView.
                      // The PageStorageKey should be unique to this ScrollView;
                      // it allows the list to remember its scroll position when
                      // the tab view is not on the screen.
                      key: new PageStorageKey<String>(name),
                      slivers: <Widget>[
                        new SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        new SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          // In this example, the inner scroll view has
                          // fixed-height list items, hence the use of
                          // SliverFixedExtentList. However, one could use any
                          // sliver widget here, e.g. SliverList or SliverGrid.
                          sliver: new SliverFixedExtentList(
                            // The items in this example are fixed to 48 pixels
                            // high. This matches the Material Design spec for
                            // ListTile widgets.
                            itemExtent: 48.0,
                            delegate: new SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                // This builder is called for each child.
                                // In this example, we just number each list item.
                                return new ListTile(
                                  title: new Text('Item $index'),
                                );
                              },
                              // The childCount of the SliverChildBuilderDelegate
                              // specifies how many children this inner list
                              // has. In this example, each tab has a list of
                              // exactly 30 items, but this is arbitrary.
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),

//      new DefaultTabController(length: tabs.length, child: new CustomScrollView(
//        slivers: <Widget>[
//          new SliverAppBar(
//            title: new Text(
//              "悦读圈",
//              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//            ),
//            backgroundColor: const Color(0xff22b2e1),
//            centerTitle: true,
//            actions: <Widget>[
//              new Image.asset(
//                "images/quan_icon_post.png",
//                width: 50.0,
//                height: 50.0,
//              )
//            ],
//            bottom:  new TabBar(
//                tabs: tabs.map((String name) => new Tab(text: name)).toList(),),
//            pinned: true,
//            expandedHeight: 250.0,
//            flexibleSpace: new FlexibleSpaceBar(
//              title: new Text(""),
//              background: new Container(color: Colors.red,),
//            ),
//          ),
//          new SliverGrid(
//            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
//              maxCrossAxisExtent: 200.0,
//              mainAxisSpacing: 10.0,
//              crossAxisSpacing: 10.0,
//              childAspectRatio: 4.0,
//            ),
//            delegate: new SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//                return new Container(
//                  alignment: Alignment.center,
//                  color: Colors.teal[100 * (index % 9)],
//                  child: new Text('grid item $index'),
//                );
//              },
//              childCount: 20,
//            ),
//          ),
//          new SliverFixedExtentList(
//            itemExtent: 50.0,
//            delegate: new SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//                return new Container(
//                  alignment: Alignment.center,
//                  color: Colors.lightBlue[100 * (index % 9)],
//                  child: new Text('list item $index'),
//                );
//              },
//            ),
//          ),
//        ],
//      ),),
    );
  }
}
