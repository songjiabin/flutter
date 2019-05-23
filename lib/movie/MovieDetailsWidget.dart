import 'package:flutter/material.dart';
import 'package:flutter_github/bean/MovieBean.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



/**
 * 电影的详情界面
 */
class MovieDetailsWidget extends StatefulWidget {

  final Subjects subjects;


  MovieDetailsWidget(@required this.subjects);

  @override
  MovieDetailsWidgetgState createState() => new MovieDetailsWidgetgState();
}

class MovieDetailsWidgetgState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.widget.subjects.title),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initNetData();
  }


  initNetData() async {
    var url = 'https://movie.douban.com/subject/26835471/';
    await http.get(url).then((response) {
      if (response.statusCode == 200) {
        String body = response.body;
       }
    });
  }


  @override
  void dispose() {
    super.dispose();
  }


}