import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/pages/Setting.dart';

class TabMyPage extends StatefulWidget {
  @override
  _TabMyPageState createState() => _TabMyPageState();
}

class _TabMyPageState extends State<TabMyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      child: new Column(
        children: <Widget>[
          _buildHead(),
          _buildCenter(),
          new Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: _buildBottom("images/collect.png", "收藏"),
          ),
          new Divider(height: 0.5),
          _buildBottom("images/comments.png", "评论回复"),
          new Divider(height: 0.5),
          _buildBottom("images/message.png", "班级管理"),
//          new Expanded(child: _buildBottom("images/message.png", "退出",onTap: (){
//            return _showDialog();
//          }),),
        ],
      ),
    ));
  }

  void _showDialog()
  {
    showDialog(context: context,builder: (BuildContext context){
      return new AlertDialog(
        content: new Text("您要退出应用吗?"),
        actions: <Widget>[
          new FlatButton(
              onPressed: () => Navigator.pop(context),
              child: new Text('取消')),
          new FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context,"/Login");

              },
              child: new Text('确定')),
        ],
      );
    });
  }
  // 头部
  Widget _buildHead() {
    return new Stack(
      children: <Widget>[
        new Image.asset(
          "images/me_img_bg.png",
          height: 250.0,
          width: 400.0,
          fit: BoxFit.fill,
        ),
        new Container(
          child: new GestureDetector(child: new Image.asset(
            "images/img_info_setting.png",
            width: 25.0,
            height: 25.0,
          ),onTap: (){
            return Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new SettingPage();
            }));
          },),
          alignment: Alignment.topRight,
          margin: const EdgeInsets.only(top: 35.0, right: 15.0),
        ),
        new Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(50.0),
            border: new Border.all(color: Colors.white, width: 2.0),
          ),
          width: 100.0,
          height: 100.0,
          child: new CircleAvatar(
            backgroundImage: new AssetImage("images/defaul_head_parent.png"),
          ),
          margin: const EdgeInsets.only(top: 74.0, left: 20.0),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 91.0, left: 146.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new Text(
                  "徐老师",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: new Text(
                  "我的第一小学",
                  style: new TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 12.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "50",
                      style: new TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: new Text(
                        "积分明细 >",
                        style:
                            new TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: new Text(
                  "（你的积分超过80%的教师）",
                  style: new TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  //center
  Widget _buildCenter() {
    return new Container(
      height: 109.0,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                "images/me_icon_borrow2.png",
                width: 35.0,
                height: 35.0,
              ),
              new Container(
                child: new Text(
                  "借书记录",
                  style: new TextStyle(
                      fontSize: 14.0, color: new Color(0xff9a9a9a)),
                ),
              )
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                "images/me_icon_barcode2.png",
                width: 35.0,
                height: 35.0,
              ),
              new Container(
                child: new Text(
                  "借书码",
                  style: new TextStyle(
                      fontSize: 14.0, color: new Color(0xff9a9a9a)),
                ),
              )
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                "images/me_icon_class.png",
                width: 35.0,
                height: 35.0,
              ),
              new Container(
                child: new Text(
                  "班级管理",
                  style: new TextStyle(
                      fontSize: 14.0, color: new Color(0xff9a9a9a)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // bottom
  Widget _buildBottom(String url, String title,{onTap}) {
    return new GestureDetector(child: Container(
      height: 56.0,
      color: Colors.white,
      child: new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(padding: const EdgeInsets.only(left: 17.0),
            child: new Image.asset(
              url,
              width: 23.0,
              height: 23.0,
            ),

          ),
          new Container(padding: const EdgeInsets.only(right: 220.0),
            child: new Text(
              title,
              style: new TextStyle(
                fontSize: 14.0,
                color: new Color(0xff9a9a9a),
              ),
            ),
          ),
          new Container(padding: const EdgeInsets.only(right: 17.0),
            child: new Image.asset(
              "images/img_userinfo_jump.png",
              width: 7.0,
              height: 14.0,
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    ),onTap: onTap,);
  }
}
