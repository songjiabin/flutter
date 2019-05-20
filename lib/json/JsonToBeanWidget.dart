import 'package:flutter/material.dart';
import 'dart:convert';


/**
 * json数据转出Bean
 */
class JsonToBeanWidget extends StatefulWidget {
  @override
  JsonToBeanWidgetState createState() => new JsonToBeanWidgetState();
}

class JsonToBeanWidgetState extends State<JsonToBeanWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: jsonToListBean(),
    );
  }

  /**
   * 将json转成对象
   */
  Widget jsonToBean() {
    var jsonString = '{"x":1,"y":2,"desc":"描述","数据":"数据"}';
    //返回一个 dynamic 的原因在于，Dart 不知道传进去的 JSON 是什么。
    // 如果是一个 JSON 对象，返回值将是一个 Map<String, dynamic>；如果是 JSON 数组，则会返回 List<dynamic>：
    dynamic obj = json.decode(jsonString);
    return new Text(obj.toString(), style: TextStyle(fontSize: 20),);
  }


  /**
   * 将json转成 list对象
   */
  Widget jsonToListBean() {
    var jsonString = '[{"x":1,"y":2,"desc":"描述","数据":"数据"},{"x":1,"y":2,"desc":"描述","数据":"数据"}]';
    //数组
    dynamic obj = json.decode(jsonString);

    List listPoint = <Point>[];
    for (var point in obj) {
      listPoint.add(Point.fromJson(point));
    }

    return new Text(listPoint.toString(), style: TextStyle(fontSize: 20),);
  }


}


class Point {
  int x;
  int y;
  String description;

  Point(this.x, this.y, this.description);

  Point.fromJson(Map<String, dynamic> map)
      : x = map['x'],
        y = map['y'],
        description = map['desc'];

  @override
  String toString() {
    return "Point{x=$x, y=$y, desc=$description}";
  }


}
