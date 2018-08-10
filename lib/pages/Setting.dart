import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => new _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /// PreferredSize可以自己定义appbar的高度
      appBar: PreferredSize(child: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text("设置"),
        leading: new GestureDetector(
          child: new Container(
            padding: const EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
            child: new Image.asset(
              "images/btn_back_yellow.png",
              width: 10.0,
              height: 10.0,
            ),
          ),
          onTap: () => Navigator.pop(context),
        ),
      ),preferredSize: Size.fromHeight(48.0),),
      body: new Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: new Column(
          children: <Widget>[
            new Container(
              color: Colors.white,
              child: ListTile(
                title: new Text(
                  "帮助中心",
                  style: new TextStyle(color: Colors.grey),
                ),
                trailing: new Image.asset(
                  "images/img_userinfo_jump.png",
                  width: 7.0,
                  height: 14.0,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            new Divider(height: 1.0),
            new Container(
              color: Colors.white,
              child: ListTile(
                title: new Text(
                  "在线客服",
                  style: new TextStyle(color: Colors.grey),
                ),
                trailing: new Image.asset(
                  "images/img_userinfo_jump.png",
                  width: 7.0,
                  height: 14.0,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            new Divider(height: 1.0),
            new Container(
              color: Colors.white,
              child: ListTile(
                title: new Text(
                  "星耀悦读服务协议",
                  style: new TextStyle(color: Colors.grey),
                ),
                trailing: new Image.asset(
                  "images/img_userinfo_jump.png",
                  width: 7.0,
                  height: 14.0,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            new Divider(height: 1.0),
            new Container(
              color: Colors.white,
              child: ListTile(
                title: new Text(
                  "修改密码",
                  style: new TextStyle(color: Colors.grey),
                ),
                trailing: new Image.asset(
                  "images/img_userinfo_jump.png",
                  width: 7.0,
                  height: 14.0,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            new Divider(height: 1.0),
            new Container(
              color: Colors.white,
              child: ListTile(
                title: new Text(
                  "当前版本",
                  style: new TextStyle(color: Colors.grey),
                ),
                trailing: new Text(
                  "2.2.1",
                  style: new TextStyle(color: Colors.grey),
                ),
              ),
            ),
            new Divider(height: 1.0),
            new Container(
              margin: const EdgeInsets.only(top: 150.0),
              width: 180.0,
              height: 40.0,
              child: RaisedButton(
                color: Colors.yellow,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0)),
                onPressed: (){
//                  return Navigator.popAndPushNamed(context, '/Login');
                  setState(() {
                      return _showDialog();
                  });
                },
                child: new Text(
                  "退出登录",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  _showDialog() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            content: new Text("您要退出应用吗?"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text('取消')),
              new FlatButton(
                  onPressed: () {
                    prefs.clear();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, '/Login');

                  },
                  child: new Text('确定')),
            ],
          );
        });
  }
}
