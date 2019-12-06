//关于 Dio 网络请求

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DioClientWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          //点击请求
          getData();
        },
      ),
    );
  }

  getData() async {
    Options options = new Options(connectTimeout: 10000);
    Response response = await Dio().post(
        "http://192.168.2.133:8080/stat_order_shop_next",
        options: options,
        queryParameters: {'page': 100});
    print(response.toString());
  }
}
