import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class MyDemoWidget extends StatefulWidget {
  @override
  myDemoState createState() => new myDemoState();
}


class myDemoState extends State<MyDemoWidget> {
  static final Options options = new Options(connectTimeout: 10000);
  var listData;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: [
          new Text(listData, textAlign: TextAlign.center)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    var url = "https://192.168.2.133:8080/android_post";
    Response response = await Dio().post(
        url,
        options: options,
        queryParameters: {
          'message': '基本密码',
          'name': '宋佳宾'});

    setState(() {
      listData = response;
    });
  }


}