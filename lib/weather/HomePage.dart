import 'package:flutter/material.dart';
import 'package:flutter_github/weather/Model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_github/weather/dio_client.dart';
import 'package:flutter_github/weather/SpClient.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * 展示天气数据
 */
class HomePageWidget extends StatefulWidget {


  RealTimeWeather _realTimeWeather;
  List<DailyForecast> _listData;
  final defalutData = '暂无数据';
  bool isNoNetwork = false;

  List<DailyForecast> defaultListData = [];

  HomePageWidget(this._realTimeWeather, this._listData);

  @override
  HomePageWidgetState createState() => new HomePageWidgetState();


}

class HomePageWidgetState extends State<HomePageWidget> {


  @override
  void initState() {
    super.initState();
    this.widget.defaultListData..add(
        DailyForecast(date: '2020-01-01',
            cond_code_d: '???',
            cond_txt_d: '---',
            tmp_max: '???',
            tmp_min: '???'))..add(
        DailyForecast(date: '2020-01-01',
            cond_code_d: '???',
            cond_txt_d: '---',
            tmp_max: '???',
            tmp_min: '???'))..add(
        DailyForecast(date: '2020-01-01',
            cond_code_d: '???',
            cond_txt_d: '---',
            tmp_max: '???',
            tmp_min: '???')
    );
  }


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
                //展示天气 温度
                getTemText(),
                //默认显示是否有没有网络
                _spaceNetWore(),
                //风向、温度、气压
                getWindHumidityPressure(),
                //未来三天的数据
                getThreeDaysDatas()
              ],
            ),
          ),
          //层叠布局刷新的按钮
          RefreshIndicator(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Center(child: SizedBox(height: 1000.0)),
            ),
            onRefresh: _pullDownRefresh, color: Colors.black26,),
          Positioned(
            child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: onClickSetting
            ),
            top: 27,
            right: 10,
          )
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
          Text(this.widget._realTimeWeather == null ? this.widget
              .defalutData : this.widget._realTimeWeather.now.tmp + '°',
            style: TextStyle(
                fontSize: 80.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          new Column(
            children: [
              this.widget._realTimeWeather == null ? Container() : Image.asset(
                  'images/weather/${this.widget._realTimeWeather.now
                      .cond_code}.png', color: Colors.white),
              SizedBox(height: 10.0),
              this.widget._realTimeWeather == null ? Container() : Text(
                this.widget._realTimeWeather.now.cond_txt,
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }


  //风向 湿度、气压


  Widget getWindHumidityPressure() {
    var widget = Padding(padding: EdgeInsets.only(bottom: 20.0),
      child: new Row(
        children: [
          Expanded(child: getWindHumidityPressureItem(
              icon: 'images/weather/wind_direction.png',
              title: '风向',
              data: this.widget._realTimeWeather == null ? this.widget
                  .defalutData : this
                  .widget._realTimeWeather.now.wind_dir
          )),
          Expanded(child: getWindHumidityPressureItem(
              icon: 'images/weather/humidity.png',
              title: '湿度',
              data: this.widget._realTimeWeather == null ? this.widget
                  .defalutData : this
                  .widget._realTimeWeather.now.hum + '%'
          )),
          Expanded(child: getWindHumidityPressureItem(
              icon: 'images/weather/air_pressure.png',
              title: '气压',
              data: this.widget._realTimeWeather == null ? this.widget
                  .defalutData : this
                  .widget._realTimeWeather.now.pres + 'hpa'
          )),
        ],
      ),
    );
    return widget;
  }

  //封装方法
  Widget getWindHumidityPressureItem(
      {@required String icon, @required String title, @required String data}) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 50.0,),
        new Column(
          children: [
            Text(title, style: TextStyle(color: Colors.white),),
            Text(data, style: TextStyle(color: Colors.white))
          ],
        ),
      ],
    );
  }

  //检测是否有网络
  Widget _spaceNetWore() {
    return Expanded(
        child: this.widget.isNoNetwork ?
        Align(
          alignment: Alignment.center,
          child: Text('请检查你的网络状态',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ) :
        Container());
  }


  //未来三天的数据
  Widget getThreeDaysDatas() {
    return new Container(
      color: Colors.white,
      //上下边距为24
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: new Row(
          children: this.widget._listData == null ? this.widget.defaultListData
              .map((item) {
            return Expanded(child: _getThreeDayDatas(item));
          }).toList() :
          this.widget._listData.map((item) {
            return Expanded(child: _getThreeDayDatas(item));
          }).toList()
      ),
    );
  }

  //未来三天数据 widget的封装
  Widget _getThreeDayDatas(DailyForecast dailyForecast) {
    //根据日期推算出星期
    String date = DateFormat('EE', 'zh_cn').format(
      DateTime.parse(dailyForecast.date),
    );

    return new Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
                date, style: TextStyle(fontSize: 15.0, color: Colors.black26))),
        Image.asset('images/weather/${dailyForecast.cond_code_d}.png',
          color: Colors.blue,),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Text(dailyForecast.cond_txt_d,
              style: TextStyle(fontSize: 15.0, color: Colors.black26)),),
        Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: Text(
              dailyForecast.tmp_min + '℃~' + dailyForecast.tmp_max + '℃',
              style: TextStyle(color: Color(0xff8a8a8a))),
        ),
      ],
    );
  }


  //refresh 刷新
  Future _pullDownRefresh() async {
    bool result = await _updateWeather();
    if (result) {
      Fluttertoast.showToast(msg: '更新成功');
    } else {
      Fluttertoast.showToast(msg: '更新失败');
    }
  }

  //更新天气
  Future<bool> _updateWeather() async {
    bool flag = true;
    String cid;
    if (SpClient.sp.getString('cid') != null) {
      cid = SpClient.sp.getString('cid');
    } else {
      cid = 'CN101010100';
    }
    await DioClient.getInstance().getRealTime(cid).then((v) {
      //当v返回不是null并且正在绑定着这个View树
      if (v != null && this.mounted) {
        if (v.status.contains('ok')) {
          print('更新当天天气成功');
          setState(() {
            this.widget._realTimeWeather = v;
          });
        } else {
          Fluttertoast.showToast(msg: '没有权限');
        }
      } else {
        flag = false;
      }
    });


    await DioClient.getInstance().getThreeDaysForecase(cid).then((v) {
      if (v != null && this.mounted) {
        print('更新未来三天天气成功');
        setState(() {
          this.widget._listData = v.dailyForecasts;
        });
      } else {
        flag = false;
      }
    });

    return flag;
  }


  //点击按钮弹
  onClickSetting() {
    showModalBottomSheet(
        context: context, builder: (BuildContext context) {
      return new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('切换城市'),
            onTap: () {

            },
          ),
          Divider(height: 0.0),
          ListTile(
            title: Text('选择语言'),
            onTap: () {

            },
          ),
          Divider(height: 0.0,),
          ListTile(
            title: Text('关于'),
            onTap: () {

            },
          )
        ],
      );
    });
  }
}