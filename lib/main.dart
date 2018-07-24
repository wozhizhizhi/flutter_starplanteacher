import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'widget/common_theme.dart';
import 'pages/splash.dart';
import 'pages/homepage.dart';
import 'pages/splash.dart';
import 'pages/login.dart';
import 'pages/tab_book_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: defaultTargetPlatform==TargetPlatform.android?androidTheme:iosTheme,
      routes: <String , WidgetBuilder>{
        '/HomePage': (BuildContext context) => new HomePage(),
        '/Splash': (BuildContext context) => new Splash(),
        '/Login': (BuildContext context) => new LoginPage(),
        '/TabBookPage': (BuildContext context) => new TabBookPage(),
      },
      home: new Splash(),
    );
  }
}

