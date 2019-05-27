import 'package:flutter/material.dart';
import 'CustomerImageTitleWidget.dart';

/**
 * 电影海报
 */
class MoviePosterWidget extends StatefulWidget {
  @override
  MoviePosterWidgetState createState() => new MoviePosterWidgetState();
}

class MoviePosterWidgetState extends State<MoviePosterWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:
      //滑动ScrollView
      SingleChildScrollView(
        child: new Column(
          children: [
            //带有波纹的image
            getImageTitle(),
          ],
        ),
      ),
    );
  }

  /**
   * 带有波纹的ImageTitle
   */
  Widget getImageTitle() {
    return
      //覆盖的布局
      Stack(
        children: <Widget>[
          //头部的image Title
          Padding(
            padding: const EdgeInsets.only(bottom: 140.0),
            child: CustomerImageTitle(),
          ),
          Positioned(
            child: getTitleContent(),
            left: 16.0,
            bottom: 0.0,
            right: 16.0,
          )
        ],
      );
  }


  /**
   * 得到标题内容相关的布局
   */
  Widget getTitleContent() {
    List<Widget> listStart = [
      Text('8.0', style: TextStyle(fontSize: 17.0, color: Colors.red,)),
      SizedBox(width: 10,)
    ];
    for (var i = 0; i < 5; i++) {
      var iconStart;
      if (i == 4) {
        iconStart = Icon(Icons.star, color: Colors.black12,);
      } else {
        iconStart = Icon(Icons.star, color: Colors.red);
      }

      listStart.add(iconStart);
    }

    return new Row(
      children: [
        //图片

        SizedBox(width: 10),
        //圆角图片
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://cdn.pixabay.com/photo/2014/04/14/20/11/japanese-cherry-trees-324175__340.jpg',
              height: 180.0,
              width: 120.0,
              fit: BoxFit.cover,
            )
        ),


        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('这个是标题',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w300)),
                  SizedBox(height: 8.0),
                  //一行
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listStart
                  ),
                  SizedBox(height: 8.0),
                  //一行
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('sub1',
                        style: TextStyle(fontSize: 16, color: Colors.black26),),
                      Text('sub2',
                        style: TextStyle(fontSize: 16, color: Colors.black26),),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  //左右滑动的标签 //横向的listView
                  getHorizontalListView(),

                ],
              ),
            )),
      ],
    );
  }

  //横向的listView
  Widget getHorizontalListView() {
    return
      new Container(
        //高度
        height: 30.0,

        child: new ListView(
          //设置为横向的
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new Center(
              child: Text('数据1'),
            ),

            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
            new Center(
              child: Text('数据1'),
            ),
          ],
        ),
      );
  }
}