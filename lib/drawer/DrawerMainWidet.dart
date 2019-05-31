import 'package:flutter/material.dart';
import 'package:flutter_github/drawer/DrawerWidget.dart';
import 'dart:math';


/**
 * 导航界面
 */
class DrawerMainWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('导航界面'),
      ),
      body: getGridViewTwo(context),
    );
  }


  getGridViewTwo(BuildContext context) {
    return new GridView(
      /**
       * 1、SliverGridDelegateWithMaxCrossAxisExtent 根据里面内容多大进行扩展的
       */
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //每一行显示多少列
          crossAxisCount: 2,
          //横轴的距离
          crossAxisSpacing: 10,
          //纵轴的距离
          mainAxisSpacing: 10,
          //横竖比例
          childAspectRatio: 1),
      children: <Widget>[
        MyText('基本控件的使用练习', () {
          pushPage(context, DrawerWidget(ShowType.SampleWidget));
        }),
        MyText('小实例学习', () {
          pushPage(context, DrawerWidget(ShowType.SampleDemo));
        }),
        MyText('小项目', () {
          pushPage(context, DrawerWidget(ShowType.SampleProject));
        }),
        MyText('跨平台', () {
          pushPage(context, DrawerWidget(ShowType.CrossPlatform));
        })
      ],
      padding: new EdgeInsets.all(4),
    );
  }

  /**
   * 界面的跳转
   */
  void pushPage(BuildContext context, Widget widget) {
    //处理跳转的逻辑
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }


}

class MyText extends StatelessWidget {

  final String text;
  final onItemClickListeners _clickListeners;

  @override
  Widget build(BuildContext context) {
    var con = new Container(
      alignment: Alignment.center,
      // 盒子样式
      decoration: new BoxDecoration(
        color: Color.fromARGB(
            255, Random().nextInt(256) + 0, Random().nextInt(256) + 0,
            Random().nextInt(256) + 0),
        //设置Border属性给容器添加边框
        border: new Border.all(
          //为边框添加颜色
          color: Color.fromARGB(
              255, Random().nextInt(256) + 0, Random().nextInt(256) + 0,
              Random().nextInt(256) + 0),
          width: 1.0, //边框宽度
        ),
      ),
      child: new Text(this.text),
    );

    InkWell inkWell = new InkWell(
      child: con,
      //点击事件
      onTap: () {
        _clickListeners();
      },
    );

    return inkWell;
  }


  MyText(this.text, this._clickListeners);

  //得到随机颜色
  Color randomColor() {
    return Color.fromARGB(
        255, Random().nextInt(256) + 0, Random().nextInt(256) + 0,
        Random().nextInt(256) + 0);
  }

}


/**
 * 定义一个接口  回调方法
 */
typedef onItemClickListeners = void Function();





