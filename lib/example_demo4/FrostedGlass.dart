import 'package:flutter/material.dart';
import 'dart:ui';


/**
 * 毛玻璃
 */
class FrostedGlassWidget extends StatefulWidget {
  @override
  FrostedGlassWidgetState createState() => new FrostedGlassWidgetState();
}

class FrostedGlassWidgetState extends State<FrostedGlassWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:
       // 先是放图片，再是放矩形，
      //层叠组件
      new Stack(
        children: <Widget>[
          //约束盒子组件 添加额外的约束  约束条件在child上
          new ConstrainedBox(
            //约束条件
            // 随着里面的东西进行扩展
            constraints: BoxConstraints.expand(),
            child: Image.network(
                'https://cdn.pixabay.com/photo/2017/09/04/20/47/child-2715429__340.jpg'),
          ),
          new Center(
            //可裁切的矩形
            child: new ClipRect(
              //背景过滤器
              child: new BackdropFilter(
                //模糊的意思
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                //透明度
                child: new Opacity(opacity: 0.5, child: new Container(
                  width: 500.0,
                  height: 500.0,
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                  child: new Center(child: Text('毛玻璃效果', style: Theme
                      .of(context)
                      .textTheme
                      .display1)),
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }

}