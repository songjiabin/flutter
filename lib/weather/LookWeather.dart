import 'package:flutter/material.dart';
import 'package:flutter_github/weather/dio_client.dart';
import 'package:flutter_github/weather/Model.dart';
import 'package:flutter_github/weather/SpClient.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_github/weather/HomePage.dart';

/**
 * 查看天气
 */
class LookWeather extends StatefulWidget {
  @override
  LookWeatherState createState() => new LookWeatherState();
}

class LookWeatherState extends State<LookWeather> {

  RealTimeWeather realTimeWeather;
  List<DailyForecast> dailyForecast;
  String text = 'text';

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: HomePageWidget(
            this.realTimeWeather, this.dailyForecast)
    );
  }

  /**
   * 更新天气情况
   */
  Future updateWeather(String location) async {
    //请求当前的天气情况
    await DioClient.getInstance().getRealTime(location).then((realTimeWeather) {
      if (RealTimeWeather != null) {
        this.realTimeWeather = realTimeWeather;
      }
    });


    //请求未来三天的
    await DioClient.getInstance().getThreeDaysForecase(location).then((
        thressDaysForeCase) {
      if (thressDaysForeCase != null) {
        this.dailyForecast = thressDaysForeCase.dailyForecasts;
      }
    });
  }


  //异步执行的列表，所有的异步方法执行顺序并不是很重要
  void getData() async {
    Future.wait([SpClient.getInstance()]).then((v) async {
      SpClient.sp.clear();
      if (SpClient.sp.getString('cid') == null) {
        //如果sp里面没有存数据 那么默认显示北京的
        SpClient.sp.setString('cid', 'CN101010100');
        await updateWeather(SpClient.sp.getString('cid'));
        setState(() {

        });
      }
    });
  }


}