import 'package:flutter/material.dart';

/**
 * 首页视图
 */
class homeWidget extends StatefulWidget {
  @override
  homeWidgetState createState() => new homeWidgetState();
}

class homeWidgetState extends State<homeWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('首页'),
        ),
        body: new Center(
          child: new Container(
            child: new Column(
              children: <Widget>[
                new Icon(Icons.home),
                new Text('首页')
              ],
            ),
            alignment: Alignment.center
          ),
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(homeWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
