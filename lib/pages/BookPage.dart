import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/r.dart';
class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage>
    with AutomaticKeepAliveClientMixin {
  final TrackingScrollController _trackingScrollController = new TrackingScrollController();
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  bool isLoadMore = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    /// 该段代码演示使用ConstrainedBox可以给定控件指定的宽度和高度
//      new Row(
//      children: <Widget>[
//        new ConstrainedBox(constraints:  const BoxConstraints(maxWidth: 50.0),child: ListView(
//          controller: _trackingScrollController,
//          children: new List<Widget>.generate(100, (int i) => new Text('page 1 item $i')).toList(),
//        ),),
//
//        new ConstrainedBox(constraints: new BoxConstraints(maxWidth: 250.0),child: ListView(
//          controller: _trackingScrollController,
//          children: new List<Widget>.generate(100, (int i) => new Text('page 1 item $i')).toList(),
//        ),),
//      ],
//    );

      Container(
      child: new ListView.builder(itemBuilder: (context,index){
         return _buildItem(context,index);
      },itemCount: 20,)
    );
  }

  Widget _buildItem(BuildContext context , int index) {
    if (index.isOdd) {
      return new Divider(height: 1.0,);
    }
    return new Container(
      color: Colors.white,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 15.0, left: 12.0, bottom: 15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  "images/cc_book_no.png",
                  width: 91.0,
                  height: 121.0,
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: new Text(
                    "2016-04-06 18:36",
                    style: new TextStyle(
                        color: const Color(0xffb2b2b2), fontSize: 11.0),
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 16.0, bottom: 15.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    child: Text(
                      "鸭子骑车记",
                      style: new TextStyle(
                          fontSize: 16.0, color: Color(0xff484848)),
                      softWrap: true,
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "难度指数：",
                          style: new TextStyle(
                              fontSize: 12.0, color: Color(0xff9a9a9a)),
                        ),
                        new Image.asset(
                          "images/rp_thunder.png",
                          width: 15.0,
                          height: 15.0,
                        ),
                        new Text(
                          " x 3",
                          style: new TextStyle(
                              fontSize: 12.0, color: Color(0xff9a9a9a)),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(right: 23.0, top: 24.0),
                    child: new Text(
                      "鸭子骑车？这可真是个疯狂的想法！但有一只鸭子真的办到了！……",
                      style: new TextStyle(
                        color: Color(0xff484848),
                      ),
                      softWrap: true,
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(right: 14.0, top: 17.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Image.asset(
                          R.imagesIconReplySPng,
                          width: 15.0,
                          height: 15.0,
                        ),
                        new Text(
                          "22",
                          style: new TextStyle(
                              color: Color(0xffb5b5b5), fontSize: 11.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
