import 'package:flutter/material.dart';

/**
 * map的使用
 * map意思是将里面的内容抽象出来，在进行处理
 */
class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Text('数据结构1'),
          Text('数据结构2'),
          Text('数据结构3'),
          Text('数据结构4'),
        ].map((widget) {
          return Padding(padding: EdgeInsets.all(19.0), child: widget);
        }).toList(),
      ),
    );
  }
}