import 'package:flutter/material.dart';
import 'dart:math' as math;

/**
 * 自定义动画
 */
class CustomAnimation extends StatefulWidget {
  @override
  CustomAnimationState createState() => new CustomAnimationState();
}

class CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {

  final padding = 16; //起初开始的位置

  AnimationController _controller;
  Animation _animation;


  @override
  Widget build(BuildContext context) {
    // 假定一个单位是 24
    final unit = 24.0;
    final marginLeft = _animation == null ? padding : _animation.value;

    // 把 marginLeft 单位化
    final unitizedLeft = (marginLeft - padding) / unit;
    final unitizedTop = math.sin(unitizedLeft);
    // unitizedTop + 1 是了把 [-1, 1] 之间的值映射到 [0, 2]
    // (unitizedTop+1) * unit 后把单位化的值转回来
    final marginTop = (unitizedTop + 1) * unit + padding;
    return Container(
      // 我们根据动画的进度设置圆点的位置
      margin: EdgeInsets.only(left: marginLeft, top: marginTop),
      // 画一个小红点
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(7.5)),
        width: 15.0,
        height: 15.0,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // mediaQueryData。这里通过创建一个 Future 从而在 Dart 事件队列里插入
    // 一个事件，以达到延后执行的目的（类似于在 Android 里 post 一个 Runnable）
    // 关于 Dart 的事件队列，读者可以参考 https://webdev.dartlang.org/articles/performance/event-loop
    Future(_initState);
  }

  void _initState() {
    // 我们通过 MediaQuery 获取屏幕宽度
    // 只有在 initState 执行完，我们才能通过 MediaQuery.of(context) 获取
    final mediaQueryData = MediaQuery.of(context);
    //获取屏幕的宽高
    final displayWidth = mediaQueryData.size.width;
    final displayHeight = mediaQueryData.size.height;


    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    //给出一个变化的位置区间
    // begin 是开始的位置是 padding的位置
    // end 是结束的位置是  屏幕宽 - padding的位置
    _animation = new Tween(begin: padding, end: displayWidth - padding).animate(
        _controller);
    _animation.addListener(() {
      setState(() {
        //每一帧都会渲染 实时更新等于是
      });
    });
    _animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        //当执行完成的时候  -》 反向执行
        _controller.reverse();
      } else if (state == AnimationStatus.dismissed) {
        //当反向执行完成的时候  -》 正向执行
        _controller.forward();
      }
    });

    //正向执行
    _controller.forward();
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}