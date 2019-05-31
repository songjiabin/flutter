import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

/**
 * 自己写一个 FutureBuild相关的网络请求
 */
class ZhihuWidget2 extends StatefulWidget {
  @override
  ZhihuWidget2State createState() => new ZhihuWidget2State();
}

class ZhihuWidget2State extends State<ZhihuWidget2> {

  Future _future;
  List<ZHData> listData = [];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder(
        builder: (context, _snapshot) {
          switch (_snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
            case ConnectionState.active:
            //当时等待的时候  loading圈
              return Center(child: CupertinoActivityIndicator());
            case ConnectionState.done:
            //完成后
              if (_snapshot.hasError) {
                //当有错的时候
                var error = _snapshot.error;
                return new Center(
                  child: Text('有错误数据${error.toString()}'),
                );
              } else {
                return new Center(
                    child:
                    ListView.builder(
                      itemBuilder: (context, itemIndex) {
                        return getListItem(itemIndex);
                      },
                      itemCount: this.listData.length,
                    )
                );
              }
          }
        },
        future: _future,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _future = _initData();
  }

  /**
   * 异步得到 Futrue
   */
  Future _initData() async {
    var _url = "https://news-at.zhihu.com/api/4/news/before/20190523";
    var response = await http.get(_url);


    var jsonStr = json.decode(response.body.toString());

    setState(() {
      listData = ZHData.jsonToBean(jsonStr);
    });


    return response;
  }

  Widget getListItem(itemIndex) {
    return
      Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: new Row(
              children: [
                Image.network(this.listData[itemIndex].img),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(this.listData[itemIndex].title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          )
      );
  }
}


class ZHData {
  String img;
  String title;

  ZHData({this.img, this.title});


  static List<ZHData> jsonToBean(Map<String, dynamic> json) {
    List<ZHData> listData = [];

    List storiesList = json['stories'] as List;

    for (var i = 0; i < storiesList.length; i++) {
      var images = storiesList[i]['images'][0];
      var title = storiesList[i]['title'];
      listData.add(ZHData(img: images, title: title));
    }


    return listData;
  }


}





