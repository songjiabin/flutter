import 'package:flutter/material.dart';

/**
 * 首页视图
 */
class contactWidget extends StatefulWidget {
  @override
  contactWidgetState createState() => new contactWidgetState();
}

class contactWidgetState extends State<contactWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('联系人'),
      ),
      body: new Center(
        child: new Container(
            child: new Column(
              children: <Widget>[
                new Icon(Icons.contacts),
                new Text('联系人')
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
  void didUpdateWidget(contactWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
