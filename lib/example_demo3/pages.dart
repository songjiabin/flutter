import 'package:flutter/material.dart';

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
        elevation: 4.0,
      ),
      backgroundColor: Colors.yellow,
      body: new Center(
          child: MaterialButton(
        onPressed: () {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) {
            return SecondPage();
          }));
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
      ),
      body: new MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: new Center(
          child: Icon(
            Icons.arrow_back,
            color: Colors.red,
            size: 64.0,
          ),
        ),
      ),
      backgroundColor: Colors.redAccent,
    );
  }
}
