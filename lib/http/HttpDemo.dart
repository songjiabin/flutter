import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/**
 * 简单的http请求
 */
class HttpDemoWidget extends StatefulWidget {
  @override
  HttpDemoWidgetState createState() => new HttpDemoWidgetState();
}

class HttpDemoWidgetState extends State<HttpDemoWidget> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<String> getMessage() async {
    try {
      var url = 'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E5%8C%97%E4%BA%AC&start=0&count=100&client=&udid=';
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = response.body;
        print(result);
        return result;
      }
    } catch (e) {
      print('getMessage: $e');
    }
  }
}