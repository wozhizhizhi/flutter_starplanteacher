import 'package:flutter/material.dart';
import 'package:flutter_starplanforparents/widget/common_webview.dart';
import 'package:flutter_starplanforparents/pages/homepage.dart';

class RouteUtil {
  // 跳转网页,使用的是动态路由
  static routetoWeb(BuildContext context, String url, String title) {
    if (url == null) {
      return;
    }
    Navigator.of(context).push(
          new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return new CommonWebView(url, title);
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return new FadeTransition(
                  opacity: animation,
                  child: new FadeTransition(
                    child: child,
                    opacity: new Tween<double>(begin: 0.5, end: 1.0)
                        .animate(animation),
                  ),
                );
              }),
        );
  }

  // 跳转到首页
  static routetoHome(BuildContext context) {
    Navigator.of(context).push(
          new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return new HomePage();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return new FadeTransition(
                  opacity: animation,
                  child: new FadeTransition(
                    child: child,
                    opacity: new Tween<double>(begin: 0.5, end: 1.0)
                        .animate(animation),
                  ),
                );
              }),
        );
  }
}
