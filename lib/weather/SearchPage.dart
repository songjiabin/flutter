import 'package:flutter/material.dart';
import 'package:flutter_github/weather/dio_client.dart';
import 'package:flutter_github/weather/Model.dart';
import 'package:flutter_github/weather/SpClient.dart';

/**
 * 搜索界面
 */
class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  List<BasicOfCity> listData = [];

  @override
  Widget build(BuildContext context) {
    //上面状态栏的高度
    double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return new Scaffold(
      appBar: PreferredSize(
          child:
          new Container(
              color: Colors.blue.withOpacity(0.6),
              padding: EdgeInsets.only(top: statusBarHeight),
              child: _getSearchappBarWidget()
          ),
          preferredSize: Size.fromHeight(56.0)),
      body: _getSearchBody(),
    );
  }


  Widget _getSearchappBarWidget() {
    return new Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:
          Image.asset(
            'images/weather/search.png', width: 20.0, color: Colors.white,),
        ),
        Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0.0),
                isDense: true,
                hintText: '城市名称中文/拼音',
              ),
              onChanged: (v) {
                DioClient.getInstance().getSearchCity(v).then((v) {
                  if (v != null && this.mounted) {
                    setState(() {
                      this.listData = v;
                    });
                  }
                });
              },
            )
        ),

        IconButton(
          icon: Text('取消'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }


  Widget _getSearchBody() {
    return
      ListView(
          children: this.listData.map((result) {
            //实现具体的布局
            var content = InkWell(
              child:
              new Container(
                padding: EdgeInsets.all(14.0),
                decoration: BoxDecoration(border: Border(
                    bottom: BorderSide(color: Color(0xffd3d3d3), width: 0.5))),
                child: Text(
                  '${result.admin_area} - ${result.parent_city} - ${result
                      .location}',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              onTap: () {
                //有波纹的点击效果
                SpClient.sp.setString('cid', result.cid);
                Navigator.pop(context, result.cid);
              },
            );
            return content;
          }).toList()
      );
  }

}