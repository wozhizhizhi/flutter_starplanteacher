import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'widget/common_theme.dart';
import 'pages/splash.dart';
import 'pages/homepage.dart';
import 'pages/splash.dart';
import 'pages/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTargetPlatform==TargetPlatform.android?androidTheme:iosTheme,
      routes: <String , WidgetBuilder>{
        '/HomePage': (BuildContext context) => new HomePage(),
        '/Splash': (BuildContext context) => new Splash(),
        '/Login': (BuildContext context) => new LoginPage(),
      },
      home: new Splash(),
    );
  }
}

