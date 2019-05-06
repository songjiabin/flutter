import 'package:flutter/material.dart';

/**
 * 自定义路由
 *
 */
class CustomeRoute extends PageRouteBuilder {

  final Widget widget;


  CustomeRoute(this.widget)
      :super(
    //过度时间
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2) {
        return widget;
      },
      //过度的效果
      transitionsBuilder: (BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child) {
        return
          //1、渐隐渐现的效果
          //getFadeEffect(animation1, child);
          //2、缩放的动画效果
//          getZoomEffect(animation1, child);
          //3、旋转 + 缩放
          //getRotateZoomEffect(animation1, child);
          //4、左右滑动的效果
          getSwipeLeftRightEffect(animation1, child);
      }
  );

  /**
   * 得到渐隐渐现的效果
   */
  static Widget getFadeEffect(Animation<double> animation1, Widget child) {
    return FadeTransition(
      //过度的透明度效果
      opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animation1,
          //动画曲线
          curve: Curves.fastOutSlowIn //快出慢进
      )),
      child: child,
    );
  }


  /**
   * 得到缩放的动画效果
   */
  static Widget getZoomEffect(Animation<double> animation1, Widget child) {
    return ScaleTransition(
      scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animation1,
          curve: Curves.fastOutSlowIn
      )),
      child: child,
    );
  }


  /**
   * 得到旋转+缩放的动画效果
   */
  static Widget getRotateZoomEffect(Animation<double> animation1,
      Widget child) {
    return
      //旋转的效果
      RotationTransition(turns: Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
              parent: animation1, curve: Curves.fastOutSlowIn)),
        child:
        //缩放
        ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
          )),
          child: child,
        ),
      );
  }


  /**
   * 得到左右滑动动画
   */
  static Widget getSwipeLeftRightEffect(Animation<double> animation1,
      Widget child) {
    return
      //左右滑动
      new SlideTransition(position: Tween<Offset>(
          begin: Offset(-1.0, 0.0),
          end: Offset(0.0, 0.0)
      ).animate(
          CurvedAnimation(parent: animation1, curve: Curves.easeInOutQuad)),
        child: child,);
  }
}




