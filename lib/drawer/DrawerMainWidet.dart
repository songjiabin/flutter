import 'package:flutter/material.dart';

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
      body: getGridViewTwo(),
    );
  }


  getGridViewTwo() {
    return new GridView(
      /**
       * 1、SliverGridDelegateWithMaxCrossAxisExtent 根据里面内容多大进行扩展的
       */
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //每一行显示多少列
          crossAxisCount: 2,
          //横轴的距离
          crossAxisSpacing: 5,
          //纵轴的距离
          mainAxisSpacing: 5,
          //横竖比例
          childAspectRatio: 1),
      children: <Widget>[
        MyText('基本控件的使用练习'),
        MyText('小实例学习'),
        MyText('小项目')
      ],
      padding: new EdgeInsets.all(5),
    );
  }
}

class MyText extends StatelessWidget {

  final String text;

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      // 盒子样式
      decoration: new BoxDecoration(
        color: Colors.blueAccent,
        //设置Border属性给容器添加边框
        border: new Border.all(
          //为边框添加颜色
          color: Colors.orange,
          width: 1.0, //边框宽度
        ),
      ),
      child: new Text(this.text),
    );
  }

  MyText(this.text);
}












