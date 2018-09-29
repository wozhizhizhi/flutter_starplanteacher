import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/net/netutil.dart';
import 'dart:async';
import 'package:flutter_starplanforparents/modle/booklistvo.dart';
import 'package:flutter_starplanforparents/modle/basemodle.dart';
import 'package:flutter_starplanforparents/widget/commonloading.dart';
import 'package:flutter_starplanforparents/pages/bookdetailpage.dart';
import 'package:flutter_starplanforparents/util/PhotoHero.dart';

class RecommendTabPage extends StatefulWidget {
  @override
  _RecommendTabPageState createState() => new _RecommendTabPageState();
}

class _RecommendTabPageState extends State<RecommendTabPage> {
  BaseModel<List<BookListVo>> model = new BaseModel<List<BookListVo>>();
  List<BookListVo> bookListvo = new List<BookListVo>();

  Future<Null> _getData() async {
    if (!mounted) return; //异步处理，防止报错
    BaseModel<List<BookListVo>> models =
        await NetUtil.getInstance().getBookListData();
    setState(() {
      model = models;
    });

    if (model.data.isNotEmpty && model.data != null) {
      bookListvo = model.data;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  // 构建列表的子项
  Widget _buidItem(int index) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Expanded(
          child: new Card(
            child: new PhotoHero(
              photo: bookListvo[index].coverUrl,
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(builder: (BuildContext context) {
                    return new BookDetailPage(
                        ids: bookListvo[index].id,
                        url: bookListvo[index].coverUrl);
                  }),
                );
//                  new Image.network(
//                    bookListvo[index].coverUrl,
//                    fit: BoxFit.fill,
//                  );
              },
            ),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 5.0),
          child: new Text(
            bookListvo[index].name,
            maxLines: 2,
            style: new TextStyle(fontSize: 12.0),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 5.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                "images/rp_thunder.png",
                width: 15.0,
                height: 15.0,
              ),
              new Text(
                " x ${bookListvo[index].difficultyIndex}",
                style: new TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var content;
    double itemWidth = MediaQuery.of(context).size.width;
    if (bookListvo.isEmpty) {
      content = new CommonLoading();
    } else {
//      content = new GridView.builder(
//        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3,
//            mainAxisSpacing: 10.0,
//            crossAxisSpacing: 10.0,
//            childAspectRatio: 0.58),
//        itemBuilder: (context, index) => _buidItem(index),
//        itemCount: model.data.length,
//        scrollDirection: Axis.vertical,
//      );
      content = new Container(
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              backgroundColor: Colors.transparent,
              title: new Text(
                "热门图书",
                style: new TextStyle(
                  fontSize: 14.0,
                  color: const Color(0xff484848),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            new SliverGrid(
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buidItem(index);
                },
                childCount: model.data.length,
              ),
              gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: itemWidth/3.0,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: itemWidth/120.0),
            )
          ],
        ),
        padding: const EdgeInsets.all(10.0),
      );
    }

    //这里没有用到上面的
    return new Scaffold(
      body: new RefreshIndicator(
        child: content,
        onRefresh: _getData,
      ),
    );
  }
}
