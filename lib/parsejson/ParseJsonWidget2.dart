import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/**
 * 解析json
 */
class ParseJsonWidget2 extends StatefulWidget {
  @override
  ParseJsonWidgetState createState() => new ParseJsonWidgetState();
}

class ParseJsonWidgetState extends State<ParseJsonWidget2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

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
    Future<String> result = rootBundle.loadString('assets/student.json');
    return result;
  }


  /**
   * 加载学生数据
   */
  loadAddress() async {
    loadAsset().then((String content) {
      final jsonResponse = json.decode(content);
      Student student = new Student.fromJson(jsonResponse);
      print(student.studentId);
    });
  }


}


class Student {
  int studentId;
  String studentName;

  Student({this.studentId, this.studentName});

  /**
   * 工厂模式解析json ，并创建bean
   */
  factory Student.fromJson(Map<String, dynamic> parseJson){
    return Student(
        studentId: parseJson['id'],
        studentName: parseJson['name']
    );
  }
}