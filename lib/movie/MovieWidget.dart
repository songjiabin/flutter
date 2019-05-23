import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_github/bean/MovieBean.dart';
import 'MovieItemWidget.dart';

/**
 * 电影列表
 */
class MovieWidget extends StatefulWidget {
  @override
  MovieWidgetState createState() => new MovieWidgetState();
}

class MovieWidgetState extends State<MovieWidget> {

  List<Subjects> listData = [];


  @override
  Widget build(BuildContext context) {
    var content = null;
    if (listData.isEmpty) {
      content = CircularProgressIndicator(
        backgroundColor: Colors.green,
      );
    } else {
      content =
      new Container(
        child: ListView.builder(
          itemCount: listData.length,
          //引入Item布局
          itemBuilder: (context, index) {
            return getItemWidget(index);
          },
        ),
      );
    }

    return new Scaffold(
      body: new Center(
        child: content,
      ),
    );
  }


  Widget getItemWidget(index) {
    return new MovieItemWidget(subjects: this.listData[index], index: index);
  }


  @override
  void initState() {
    super.initState();
    getMovieData();
  }

  getMovieData() async {
    var url = 'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E5%8C%97%E4%BA%AC&start=0&count=100&client=&udid=';
    await http.get(url).then((response) {
      if (response.statusCode == 200) {
        String bodey = response.body;
        final jsonData = json.decode(bodey);
        //刷新数据
        setState(() {
          final movie = Movie.jsonToBean(jsonData);
          listData = movie.subjects;
        });
      } else {
        //请求失败的情况下
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
  }


}