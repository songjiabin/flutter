import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/**
 * 解析json  解析[]数据
 */
class ParseJsonWidget2 extends StatefulWidget {
  @override
  ParseJsonWidgetState createState() => new ParseJsonWidgetState();
}

class ParseJsonWidgetState extends State<ParseJsonWidget2> {

  Address _address;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text(_address.toString()),
    );
  }

  @override
  void initState() {
    super.initState();
    loadAddress();
  }


  /**
   * 加载assdt json数据
   */
  Future<String> loadAsset() async {
    Future<String> result = rootBundle.loadString('assets/address.json');
    return result;
  }


  /**
   * 加载学生数据
   */
  loadAddress() async {
    loadAsset().then((String content) {
      final jsonResponse = json.decode(content);
      setState(() {
        _address = new Address.fromJson(jsonResponse);
       });
    });
  }


}

/**
 * {
    "city": "Mumbai",
    "streets": [
    "address1",
    "address2"
    ]
    }
 */
class Address {
  String city;
  List<String> streets;

  Address({this.city, this.streets});

  /**
   * 工厂模式解析json ，并创建bean
   */
  factory Address.fromJson(Map<String, dynamic> parseJson){
    //将 streets 转换成了 dynamic类型

    var streetsFromJson = parseJson['streets'];

    //将dynamic类型 转换成了 List<String> 类型
    List<String> streetsString = streetsFromJson.cast<String>();


    return Address(
        city: parseJson['city'],
        streets: streetsString
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Address{city=$city, streets=[${streets.map((i) => {i
    })}]";
  }
}