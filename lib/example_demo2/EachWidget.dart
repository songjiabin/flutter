import 'package:flutter/material.dart';

/**
 * 每个Widget
 */
class EachWidget extends StatefulWidget {

  String _title;

  @override
  EachWidgetWidgetState createState() => new EachWidgetWidgetState();

  EachWidget(@required String this._title);

}

class EachWidgetWidgetState extends State<EachWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.widget._title,
          textDirection: TextDirection.ltr,),
      ),
      body: new Center(
        child: new Text(this.widget._title,
          textDirection: TextDirection.ltr,),
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget._title);
  }
}