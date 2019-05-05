import 'package:flutter/material.dart';

/**
 * 首页视图
 */
class descriptionWidget extends StatefulWidget {
  @override
  descriptionWidgetState createState() => new descriptionWidgetState();
}

class descriptionWidgetState extends State<descriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('描述'),
      ),
      body: new Center(
        child: new Container(
            child: new Column(
              children: <Widget>[
                new Icon(Icons.description),
                new Text('描述')
              ],
            )
        ),
      ),
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
  void didUpdateWidget(descriptionWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
