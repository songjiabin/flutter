import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_github/bean/MovieBean.dart';
import 'package:flutter_github/bean/MovieBean2.dart';
/**
 * 解析json  解析复杂的嵌套结构
 */
class ParseJsonWidget8 extends StatefulWidget {
  @override
  ParseJsonWidgetState createState() => new ParseJsonWidgetState();
}

class ParseJsonWidgetState extends State<ParseJsonWidget8> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(





    );
  }

  @override
  void initState() {
    super.initState();
    loadProduct();
  }


  /**
   * 加载assdt json数据
   */
  Future<String> loadAsset() async {
    Future<String> result = rootBundle.loadString('assets/movie.json');
    return result;
  }


  /**
   * 加载学生数据
   */
  loadProduct() async {
    loadAsset().then((String content) {
      try {
        List<Movie2> movieList = Movie2.jsonToBean(content);
        print(movieList);
      } catch (e) {
        print(e);
      }
    });
  }
}










