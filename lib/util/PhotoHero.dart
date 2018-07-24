import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;
  final double height;

  PhotoHero({Key key, this.photo, this.onTap, this.width,this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new SizedBox(width: width,height: height,
      /**
       *
          InkWell包裹图片，来轻松给源和目标 hero 添加点击事件。
          使用透明色定义“Material” widget可使图片在飞向目标时看到背景。
          SizedBox在动画的开始和结束处指定 hero 的大小。
          将图片的fit属性设置为BoxFit.contain，可以确保图片在转换过程中尽可能大而不改变其长宽比。

       */
      child: new Hero(
          tag: photo,
          child: new Material(
            color: Colors.transparent,
            child: new InkWell(
              onTap: onTap,
              child: new Image.network(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}
