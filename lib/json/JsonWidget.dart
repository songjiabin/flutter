import 'package:flutter/material.dart';
import 'dart:convert';


/**
 * 对象=>Json
 */
class JsonWidget extends StatefulWidget {


  @override
  JsonWidgetState createState() => new JsonWidgetState();
}

class JsonWidgetState extends State<JsonWidget> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: toJsonArrayString(),
    );
  }


  /**
   * 得到json数据
   */
  Widget toJsonString() {
    Point point = new Point(1, 1, '描述');
    var pointJson = json.encode(point);

    return new Text(pointJson, style: TextStyle(fontSize: 20),);
  }

  /**
   * 得到json数组
   */
  Widget toJsonArrayString() {
    Point point = new Point(1, 2, '描述');

    List<Point> list = [];

    list.add(point);
    list.add(point);

    var pointListJson = json.encode(list);

    print(pointListJson);

    return Text(
        pointListJson
    );
  }


}


class Point {

  int x;
  int y;
  String description;

  Point(this.x, this.y, this.description);


  // 注意，我们的方法只有一个语句，这个语句定义了一个 map。
  // 使用这种语法的时候，Dart 会自动把这个 map 当做方法的返回值
  Map<String, dynamic> toJson() =>
      {
        'x': x,
        'y': y,
        'desc': description,
        '数据': '数据'
      };
}