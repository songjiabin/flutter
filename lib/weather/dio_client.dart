import 'package:dio/dio.dart';
import 'package:flutter_github/weather/Model.dart';


/**
 *网络请求的单例模式
 */
class DioClient {

  static DioClient _instance; //单例对象
  factory DioClient() => getInstance();


  //得到单例情况下的对象
  static DioClient getInstance() {
    if (_instance == null) {
      return DioClient._internal();
    }
  }

  //构造方法
  DioClient._internal(){

  }


  //根路径  和风数据
  static final String rootUrl = 'https://free-api.heweather.net/s6/weather';

  //key
  static final String key = "48adaf0a84904179a10dc5bcfe8a5bf8";

  //连接超时时间
  static final Options options = new Options(connectTimeout: 10000);

  //得到实时的天气情况
  // url => https://free-api.heweather.net/s6/weather/now?location=beijing&key=48adaf0a84904179a10dc5bcfe8a5bf8
  Future<RealTimeWeather> getRealTime(String location) async {
    String url = rootUrl + '/now';
    try {
      Response response = await Dio().get(
          url,
          options: options,
          queryParameters: {
            'location': location,
            'key': key});

      RealTimeWeather realTimeWeather = RealTimeWeather.jsonToBean(
          response.data['HeWeather6'][0]);

      if (!realTimeWeather.status.contains('ok')) {
        return realTimeWeather;
      }

      //现在的天气情况
      Now now = Now.jsonToBean(realTimeWeather.mNow);

      //接口更新的时间
      Update update = Update.jsonToBean(realTimeWeather.mUpdate);

      //基础数据
      Basic basic = Basic.jsonToBean(realTimeWeather.mBasic);


      realTimeWeather.basic = basic;
      realTimeWeather.now = now;
      realTimeWeather.update = update;

      return realTimeWeather;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  //得到3天预报
  Future<ThressDaysForeCase> getThreeDaysForecase(String location) async {
    String url = rootUrl + '/forecast';

    try {
      Response response = await Dio().get(
          url, options: options, queryParameters: {
        'location': location,
        'key': key
      });


      ThressDaysForeCase thressDaysForeCase = ThressDaysForeCase.jsonToBean(
          response.data['HeWeather6'].first);

      if (!thressDaysForeCase.status.contains('ok')) {
        return thressDaysForeCase;
      }

      thressDaysForeCase.basic = Basic.jsonToBean(thressDaysForeCase.mBasic);
      thressDaysForeCase.update = Update.jsonToBean(thressDaysForeCase.mUpdate);

      return thressDaysForeCase;
    } catch (e) {
      print(e);
      return null;
    }
  }
}


