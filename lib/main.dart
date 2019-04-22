import 'package:flutter/material.dart';

void main() {
  runApp(getWidget());
}

Widget getWidget() {
  /**
   * 1、hello world
   */
//  return new HelloWorldApp();

  /**
   * 2、Container  类型快
   */
//  return new ContainerApp();

  /**
   * 3、image 图片
   */
//  return new ImageApp();

  /**
   * 4、listView 列表 纵向
   */
//  return new ListViewApp();


  /**
   * 5、横线的ListView
   */
//  return new ListViewHorizontalApp();


  /**
   * 动态的listView
   */
  return new DynamicListViewApp();
}


class DynamicListViewApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}


/**
 * 横向的ListView
 */
class ListViewHorizontalApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '横线ListView',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('横线ListView'),
        ),
        body: new Center(
            child: new Container(
              height: 200.0,
              child: new ListView(
                //设置为横向的listView
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  new Container(
                    width: 180.0,
                    color: Colors.red,
                    child: new Text('横向的ListView1'),
                    alignment: Alignment.center,
                  ), new Container(
                    width: 180.0,
                    color: Colors.blueGrey,
                    child: new Text('横向的ListView2'),
                    alignment: Alignment.center,
                  ), new Container(
                    width: 180.0,
                    color: Colors.deepOrangeAccent,
                    child: new Text('横向的ListView3'),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

}


/**
 * ListView 列表
 */
class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'ListView',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ListView'),
        ),
        body: new ListView(
            children: getImageWidget()
        ),
      ),
    );
  }

  /**
   * 获取 ListTile类型的widget
   */
  Widget getWidget() {
    return new ListTile(leading: new Icon(Icons.repeat_one),
        title: const Text('ListView数据'));
  }

  getImageWidget() {
    List<Widget> listWidget = [];
    for (int i = 0; i < 200; i++) {
      if (i % 2 == 0) {
        listWidget.add(new Container(
          child: new Image.network(
            'https://images.unsplash.com/photo-1555611433-36d9f95463c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.fitWidth,
          ),
          width: 400.0,
          height: 400.0,
          color: Colors.lightBlue,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 1),
        ));
      } else {
        listWidget.add(new Container(
          child: new Image.network(
            'https://images.unsplash.com/photo-1555525088-c3db28e2d0d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.fitHeight,
          ),
          width: 400.0,
          height: 400.0,
          color: Colors.red,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 1),
        ));
      }
    }
    return listWidget;
  }

}


/**
 * image
 */
class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Title',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Image'),
        ),
        body: new Center(
          child: new Container(
            child: new Image.network(
              "https://images.unsplash.com/photo-1555847166-ca9cd76d2490?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
              //如何填充
              /**
               * 1、BoxFit.contain   不做任何处理
               * 2、BoxFit.fill      拉伸图片
               * 3、BoxFit.fitWidth  横向必须显示完全
               * 4、BoxFit.fitHeight 纵向必须显示完全
               * 5、BoxFit.cover,    图片可以裁切，但是必须显示全
               */
              fit: BoxFit.cover,
              //图片混合 必须和 color混合使用
              colorBlendMode: BlendMode.dstATop,
              color: Colors.pink,
              //图片是否进行重复 以中心为基础
              repeat: ImageRepeat.repeat,
            ),
            height: 500.0,
            width: 10000.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

}


/**
 * 容器：Container
 */
class ContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Title',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Title"),
        ),
        body: new Center(
          child: new Container(
            child: new Text('基本密码',
                style: new TextStyle(fontSize: 40.0)),
            // Container中的对齐方式
            alignment: Alignment.topLeft,
            height: 500.0,
            width: 500.0,
            //背景颜色
            /* color: Colors.red,*/
            //内边距 1、EdgeInsets.all(10.0)   所以的边距 2、上下左右边距 EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0)
            padding: new EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
            //外边据 1、EdgeInsets.all(30.0)   所以的边距 2、上下左右边距 EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0)
            margin: const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
            //装饰
            decoration: new BoxDecoration(
              //渐变颜色 注意和 color 不能并用
                gradient: new LinearGradient(
                    colors: [Colors.red, Colors.blue, Colors.yellow]),
                //边框
                border: Border.all(width: 9.0, color: Colors.purple)
            ),
          ),
        ),
      ),
    );
  }

}

/**
 * Hello  world
 * Text 属性
 */
class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter'),
        ),
        body: new Center(
          child: new Text(
            'BodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBody',
            //文字居中对齐方式
            textAlign: TextAlign.center,
            //最大显示几行
            maxLines: 1,
            // 显示的属性 1、ellipsis 省略号 2、fade 从上而下的渐变
            overflow: TextOverflow.fade,
            //字体样式
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.blue,
                //下划线
                decoration: TextDecoration.underline,
                //下划线的类型
                decorationStyle: TextDecorationStyle.solid
            ),
          ),
        ),
      ),
    );
  }
}






