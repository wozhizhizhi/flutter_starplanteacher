import 'package:flutter/material.dart';

class TabMyPage extends StatefulWidget {
  @override
  _TabMyPageState createState() => _TabMyPageState();
}

class _TabMyPageState extends State<TabMyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new DecoratedBox(
      decoration: new BoxDecoration(
        gradient: new RadialGradient(
          center: const Alignment(-0.5, -0.6),
          radius: 0.15,
          colors: <Color>[
            const Color(0xFFEEEEEE),
            const Color(0xFF111133),
          ],
          stops: <double>[0.9, 1.0],
        ),
      ),
    ));
  }
}