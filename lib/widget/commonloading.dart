import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Image.asset("images/tk_img_loading_anim.gif"),
            new Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text("数据正在加载中请稍后..."),
            )
          ],
        ),
      ),
    );
  }
}
