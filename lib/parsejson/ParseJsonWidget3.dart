import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/**
 * 解析json  解析{}数据
 */
class ParseJsonWidget3 extends StatefulWidget {
  @override
  ParseJsonWidgetState createState() => new ParseJsonWidgetState();
}

class ParseJsonWidgetState extends State<ParseJsonWidget3> {

  Shape _shape;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text(_shape.toString()),
    );
  }

  @override
  void initState() {
    super.initState();
    loadShape();
  }


  /**
   * 加载assdt json数据
   */
  Future<String> loadAsset() async {
    Future<String> result = rootBundle.loadString('assets/shape.json');
    return result;
  }


  /**
   * 加载学生数据
   */
  loadShape() async {
    loadAsset().then((String content) {
      final jsonResponse = json.decode(content);
      setState(() {
        _shape = Shape.fromJson(jsonResponse);
      });
    });
  }


}

/**
 * {
    "shape_name":"rectangle",
    "property":{
       "width":5.0,
       "breadth":10.0
    }
    }
 */
class Shape {
  final String shape_name;
  final Property property;

  Shape({this.shape_name, this.property});


  factory Shape.fromJson(Map<String, dynamic> parsedJson){
    return Shape(
        shape_name: parsedJson['shape_name'],
        property: Property.fromJson(parsedJson['property'])
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Shape{shape_name:$shape_name,property:{width:${property
        .width},breadth:${property.breadth}';
  }


}

class Property {
  final double width;
  final double breadth;

  Property({this.width, this.breadth});


  factory Property.fromJson(Map<String, dynamic> json){
    return Property(
        width: json['width'],
        breadth: json['breadth']
    );
  }


}





