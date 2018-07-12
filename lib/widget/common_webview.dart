import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class CommonWebView extends StatefulWidget {
  final String url;
  final String title;

  CommonWebView(this.url, this.title);
  @override
  _CommonWebViewState createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
      url: widget.url,
      withJavascript: true,
      withZoom: false,
      withLocalStorage: true,
    );
  }
}
