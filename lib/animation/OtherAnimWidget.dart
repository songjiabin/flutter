import 'package:flutter/material.dart';

/**
 * 非线性动画
 */
class OtherAnimWidget extends StatefulWidget {
  @override
  OtherAnimWidgetState createState() => new OtherAnimWidgetState();
}

class OtherAnimWidgetState extends State<OtherAnimWidget>
    with SingleTickerProviderStateMixin {

  //非线性动画控制器
  AnimationController _controller;
  CurvedAnimation _animation;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      child: FlutterLogo(size: 200.0),
      // 注意，这里我们把原先的 controller 改为了 curve
      scale: _controller,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 3000)
    );

    //非线性动画
    _animation = CurvedAnimation(
      parent: _controller,
      //动画的出厂方式
      curve: Curves.easeInOut,
    );

    // 调用 forward 方法开始动画
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


}