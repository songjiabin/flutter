import 'package:flutter/material.dart';
import 'package:flutter_github/bean/MovieBean.dart';
import 'package:flutter_github/movie/MovieDetailsWidget.dart';

/**
 * movie item
 */
class MovieItemWidget extends StatefulWidget {

  final Subjects subjects;
  final int index;


  MovieItemWidget({@required this.subjects, @required this.index});

  @override
  MovieItemWidgetState createState() => new MovieItemWidgetState();
}

class MovieItemWidgetState extends State<MovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    var content = new Container(
        padding: EdgeInsets.all(6.0),
        child: Row(

          children: <Widget>[
            //图片
            getImageWidget(),
            Expanded(
              child:
              Padding(padding: EdgeInsets.all(10.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //电影名字
                      Text(this.widget.subjects.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      //导演
                      Text('导演: ' + this.widget.subjects.directors[0].name,
                          style: TextStyle(fontSize: 14)),
                      //演员
                      getDirectorWidget(),
                      //类型
                      getTypeWidget(),
                      //制片国家
                      getCreateCountry(),
                      //上映日期
                      Text('上映日期: ' + this.widget.subjects.year,
                          style: TextStyle(fontSize: 14)),
                      //片长
                      Text('片长: ' + this.widget.subjects.durations[0],
                          style: TextStyle(fontSize: 14)),
                      //评分
                      Text('评分: ' + this.widget.subjects.rating.average,
                        style: TextStyle(fontSize: 14, color: Colors.red),),
                    ],
                  )
              ),
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        )
    );


    var inkell = InkWell(
      onTap: () {
        //点击进入详情界面
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return MovieDetailsWidget(this.widget.subjects);
        }));
      },
      child: content,
      splashColor: Colors.grey,
      highlightColor: Colors.grey,
    );

    return inkell;
  }

  // 图片
  Widget getImageWidget() {
    String img = this.widget.subjects.images.large;
    return
      Image.network(img, fit: BoxFit.cover, height: 170, width: 130);
  }

  //得到主演信息
  Widget getDirectorWidget() {
    var director = "主演: ";
    this.widget.subjects.casts.map((i) => i.name + "/").forEach((i) {
      director += i;
    });
    return new Text(
      director.substring(0, director.length - 1),
      style: TextStyle(
        fontSize: 14,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  //类型
  Widget getTypeWidget() {
    var director = "类型: ";
    this.widget.subjects.genres.forEach((i) {
      director += i + "/";
    });
    return new Text(
      director.substring(0, director.length - 1),
      style: TextStyle(
        fontSize: 14,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }


  //产于哪里
  Widget getCreateCountry() {
    var createCountry = "制片国家: ";
    this.widget.subjects.pubdates.forEach((i) {
      createCountry += i + "/";
    });
    return new Text(
      createCountry.substring(0, createCountry.length - 1),
      style: TextStyle(
        fontSize: 14,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }


}