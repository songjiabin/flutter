import 'package:flutter/material.dart';

/**
 * 闪屏界面
 */
class SplashScreenWidget extends StatefulWidget {
  @override
  SplashScreenWidgetState createState() => new SplashScreenWidgetState();
}

//  SingleTickerProviderStateMixin 混入
class SplashScreenWidgetState extends State<SplashScreenWidget>
    with SingleTickerProviderStateMixin {

  //控制动画的控制器
  AnimationController _controller;

  //控制的动画
  Animation _animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
        vsync: this,
        //持续的时间
        duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      return getListener(status);
    });
  }

  /**
   * 动画执行的状态
   */
  AnimationStatusListener getListener(var states) {
    if (states == AnimationStatus.completed) {
        //动画结束 路由跳转
//      Navigator.of(context).pushAndRemoveUntil(newRoute, predicate );
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }
}