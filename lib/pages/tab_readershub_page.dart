import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class TabReadHubPage extends StatefulWidget {
  @override
  _TabReadHubPageState createState() => _TabReadHubPageState();
}

class _TabReadHubPageState extends State<TabReadHubPage> {
  static const platformMethodChannel =
      const MethodChannel("com.xyjy.flutterchannel/test");
  num nativeMessage = 0;

  Future<Null> getData() async {
    num _message;
    try {
      final num result = await platformMethodChannel.invokeMethod("getTime");
      _message = result;
    } on PlatformException catch (e) {
      print(e.message);
    }
    setState(() {
      nativeMessage = _message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () => getData(),
              child: new Text("$nativeMessage"),
            )
          ],
        ),
      ),
    );
  }
}
