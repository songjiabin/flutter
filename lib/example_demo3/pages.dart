import 'package:flutter/material.dart';
import 'package:flutter_github/example_demo3/CustomeRoute.dart';


/**
 * 第一个widget
 */
class FirstWidget extends StatefulWidget {
  @override
  FirstWidgetState createState() => new FirstWidgetState();
}

class FirstWidgetState extends State<FirstWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第一个界面'),
        //和背景相融合的程度
        elevation: 4.0,
      ),
      backgroundColor: Colors.yellow,
      body: new Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(CustomeRoute(new SecondPage()));
            },
            child: Icon(
              Icons.navigate_next,
              color: Colors.red,
              size: 64.0,
            ),
          )),
    );
  }
}

/**
 * 第二个界面
 */
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个界面'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              tooltip: MaterialLocalizations
                  .of(context)
                  .openAppDrawerTooltip,
              onPressed: () {},
            );
          },
        ),
        //居中标题
        centerTitle: true,
      ),
      body: new Center(
          child: new MaterialButton(onPressed: () {
            //返回
            Navigator.of(context).pop();
          }, child: Icon(
            Icons.arrow_back,
            color: Colors.black54,
            size: 44.0,
          ),)
      ),

      backgroundColor: Colors.redAccent,
    );
  }
}
