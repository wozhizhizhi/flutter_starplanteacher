import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

class BookDetailPage extends StatefulWidget {
  int ids = 0;
  String url;
  BookDetailPage({Key key, @required this.ids, @required this.url})
      : super(key: key);
  @override
  _BookDetailPageState createState() => new _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Builder(
        builder: (context) => new SliverFab(
              slivers: <Widget>[
                new SliverAppBar(
                  expandedHeight: 256.0,
                  pinned: true,
                  flexibleSpace: new FlexibleSpaceBar(
                    title: new Text("SliverFab Example"),
                    background: new Image.asset(
                      "images/img_record_bg.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                new SliverList(
                  delegate: new SliverChildListDelegate(
                    new List.generate(
                      30,
                      (int index) =>
                          new ListTile(title: new Text("Item $index")),
                    ),
                  ),
                ),
              ],
              floatingActionButton: null,
              expandedHeight: 256.0,
            ),
      ),
    );
  }
}
