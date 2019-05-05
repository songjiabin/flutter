import 'package:flutter/material.dart';

/**
 * 电池视图
 */
class batteryWidget extends StatefulWidget {
  @override
  batteryWidgetState createState() => new batteryWidgetState();
}

class batteryWidgetState extends State<batteryWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('电池'),
        ),
        body: new Center(
          child: new Container(
              child: new Column(
                children: <Widget>[
                  new Icon(Icons.battery_std),
                  new Text('电池')
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
  void didUpdateWidget(batteryWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
