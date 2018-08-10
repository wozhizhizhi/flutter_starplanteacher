import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/pages/BookPage.dart';
import 'package:flutter_starplanforparents/pages/TieziPage.dart';

class ShouChangPage extends StatefulWidget {
  @override
  _ShouChangPageState createState() => _ShouChangPageState();
}

class _ShouChangPageState extends State<ShouChangPage>
    with SingleTickerProviderStateMixin {
  var titles = ["图书", "帖子"];
  TabController tabController;
  final List<Tab> myTabs = <Tab>[
    new Tab(text: "图书"),
    new Tab(text: '帖子'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new GestureDetector(
          child: new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Image.asset(
              "images/btn_back_yellow.png",
              width: 15.0,
              height: 15.0,
            ),
          ),
        onTap: (){
            Navigator.pop(context);
        },),
        title: new TabBar(
          labelColor: const Color(0xff22b2e1),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xff22b2e1),
          controller: tabController,
          tabs: myTabs,
        ),
      ),
      body: new TabBarView(
        children: [
          new BookPage(),
          new TeiziPage(),
        ],
        controller: tabController,
      ),
    );
  }
}
