import 'package:flutter/material.dart';


/**
 * 线性动画
 */
class AnimWidget extends StatefulWidget {
  @override
  AnimWidgetState createState() => new AnimWidgetState();
}


/**
 * 继承  SingleTickerProviderStateMixin
 */
class AnimWidgetState extends State<AnimWidget>
    with SingleTickerProviderStateMixin {

  AnimationController controller;

  Animation _animation;
  Animation tween;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      // 提供 vsync 最简单的方式，就是直接继承 SingleTickerProviderStateMixin
      vsync: this,
      //持续时长
      duration: Duration(milliseconds: 3000),
    );
    //补间动画 设置从 0 开始到 1.0
    _animation = Tween(begin: 0.0, end: 1.0).animate(controller);


    _animation.addListener(() {
      //一定写上这个 不然动画不执行
      setState(() {

      });
    });


    //监听动画的状态
    _animation.addStatusListener((status) {

    });


    //当动画完成后 调用它的话 继续反向执行动画
    // controller.reverse();

    //调用forward开始动画
     controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    InkWell inkWell = new InkWell(
        onTap: () {
          startAnimtaion();
        },
        child:
        getScaleWidget());
//        getTextWidget());

    return inkWell;
  }


  startAnimtaion() {
    setState(() {
      controller.forward(from: 0);
    });
  }


  /**
   * 第一种动画方式
   */
  Widget getScaleWidget() {
    return ScaleTransition(
      scale: controller,
      child: new Center(
          child: Text('逐渐放大')
      ),
    );
  }

  /**
   * 第二种动画方式
   */
  Widget getTextWidget() {
    return new Center(
        child: new Text(
          "Flutter Animation(一)",
          style: TextStyle(fontSize: 20 * _animation.value), //更改文本字体大小
        )
    );
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}