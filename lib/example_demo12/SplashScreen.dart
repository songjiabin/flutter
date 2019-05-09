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
    //使用我们的控制器播放动画
    _controller.forward();
  }

  /**
   * 动画执行的状态
   */
  AnimationStatusListener getListener(var states) {
    print('开始了');
    if (states == AnimationStatus.completed) {
      //动画结束 路由跳转


      //跳转界面的后 销毁当前的界面
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }), (route) {
        return route == null;
      });


//      Navigator.of(context).pushAndRemoveUntil(
//          new MaterialPageRoute(builder: (context) => MyHomePage()),
//              (route) => route == null);


      // 简单的跳转
//      Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//        return MyHomePage();
//      }));
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('闪屏界面'),
      ),
      body:
      //透明度多度
      new FadeTransition(
        opacity: _animation,
        child: Image.network(
          'https://images.unsplash.com/photo-1557144033-f26d160cf6fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          //缩放
//          scale: 2.0,
          //充满外部容器
          fit: BoxFit.cover,

        ),
      )
      ,
    );
  }

  /**
   * 销毁的时候
   */
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}


class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("新界面"),
      ),
      body: new Container(
        //宽度
        width: 500.0,
        //高度
        height: 500.0,

        color: Colors.lightBlue,
      ),
    );
  }

}