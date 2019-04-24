import 'package:flutter/material.dart';


class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'title',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Scend App'),
        ),
        body: new Center(
          child: new Text('eeee'),
        ),
      ),
    );
  }

}