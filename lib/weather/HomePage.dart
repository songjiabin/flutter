import 'package:flutter/material.dart';
import 'package:flutter_github/weather/Model.dart';


/**
 * 展示天气数据
 */
class HomePageWidget extends StatefulWidget {


  RealTimeWeather _realTimeWeather;
  List<DailyForecast> _listData;
  final defalutData = '暂无数据';

  HomePageWidget(this._realTimeWeather, this._listData);

  @override
  HomePageWidgetState createState() => new HomePageWidgetState();


}

class HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //控制界面内容 body  是否重新布局来避免底部被覆盖了，比如当键盘显示的时候，重新布局避免被键盘盖住内容。默认值为 true。
      resizeToAvoidBottomInset: false,
      //覆盖布局
      body: Stack(
        children: <Widget>[
          new Container(
            width: 1000,
            height: 10000,
            decoration: BoxDecoration(
              //边框 展示一个渐变的颜色
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.blue, Colors.blue.withOpacity(0.3)],
              ),
            ),
            child: new Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                //地区
                getLocationText(),
                //展示天气
                getTemText()
              ],
            ),
          ),

        ],
      ),
    );
  }

  // 展示地区
  Widget getLocationText() {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          this.widget._realTimeWeather == null ? this.widget.defalutData : this
              .widget
              ._realTimeWeather.basic.location,
          style: TextStyle(fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ));
  }


  //展示温度
  Widget getTemText() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(this.widget._realTimeWeather.now.tmp == null ? this.widget
              .defalutData : this.widget._realTimeWeather.now.tmp + '°',
            style: TextStyle(
                fontSize: 80.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }


  @override
  void initState() {
    super.initState();
  }

}