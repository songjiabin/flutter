//实时的天气状态 bean
class RealTimeWeather {
  Basic basic;
  Now now;
  Update update;
  String status;


  Map mBasic;
  Map mUpdate;
  Map mNow;


  RealTimeWeather(
      {this.basic, this.now, this.update, this.status, this.mBasic, this.mNow, this.mUpdate});

  factory RealTimeWeather.jsonToBean(Map<String, dynamic> json){
    return RealTimeWeather(
        mBasic: json['basic'],
        status: json['status'],
        mNow: json['now'],
        mUpdate: json['update']
    );
  }
}


class Basic {
  String cid; // 地区/城市ID
  String location; // 地区/城市名称
  String parentCity; // 该地区/城市的上级城市
  String adminArea; // 该地区/城市所属行政区域
  String cnty; // 该地区/城市所属国家名称
  String lat; // 地区/城市纬度
  String lon; // 地区/城市经度
  String tz; // 该地区/城市所在时区

  Basic({this.cid, this.location, this.parentCity, this.adminArea, this.cnty,
    this.lat, this.lon, this.tz});


  factory Basic.jsonToBean(Map<String, dynamic> json){
    return Basic(
      cid: json['cid'],
      location: json['location'],
      parentCity: json['parent_city'],
      adminArea: json['admin_area'],
      cnty: json['cnty'],
      lon: json['lon'],
      lat: json['lat'],
      tz: json['tz'],
    );
  }


}


// 实况天气
class Now {
  String cloud;
  String cond_code;
  String cond_txt;
  String fl;
  String hum;
  String pcpn;
  String pres;
  String tmp;
  String vis;
  String wind_deg;
  String wind_dir;
  String wind_sc;
  String wind_spd;


  Now({this.cloud, this.cond_code, this.cond_txt, this.fl, this.hum, this.pcpn,
    this.pres, this.tmp, this.vis, this.wind_deg, this.wind_dir, this.wind_sc,
    this.wind_spd});

  factory Now.jsonToBean(Map<String, dynamic> json){
    return Now(
      cloud: json['cloud'],
      cond_code: json['cond_code'],
      cond_txt: json['cond_txt'],
      fl: json['fl'],
      hum: json['hum'],
      pcpn: json['pcpn'],
      pres: json['pres'],
      tmp: json['tmp'],
      vis: json['vis'],
      wind_deg: json['wind_deg'],
      wind_dir: json['wind_dir'],
      wind_sc: json['wind_sc'],
      wind_spd: json['wind_spd'],
    );
  }


}

//接口更新时间
class Update {
  String loc; // 当地时间，24小时制，格式yyyy-MM-dd HH:mm
  String utc; // UTC时间，24小时制，格式yyyy-MM-dd HH:mm

  Update({this.loc, this.utc});

  factory Update.jsonToBean(Map<String, dynamic> json){
    return Update(
        loc: json['loc'],
        utc: json['utc']
    );
  }
}


class ThressDaysForeCase {
  Map mBasic;
  Map mUpdate;
  Map mNow;

  String status;
  Basic basic;
  Update update;


  List<DailyForecast> dailyForecasts = [];

  ThressDaysForeCase({this.mBasic, this.mUpdate, this.status,
    this.basic, this.update, this.dailyForecasts});


  factory ThressDaysForeCase.jsonToBean(Map<String, dynamic> json){
    List list = json['daily_forecast'] as List;
    List<DailyForecast> listDaily = list.map((i) => DailyForecast.jsonToBean(i))
        .toList();

    return ThressDaysForeCase(
        status: json['status'],
        mBasic: json['basic'],
        mUpdate: json['update'],
        dailyForecasts: listDaily
    );
  }

}

class DailyForecast {


  String cond_code_d;
  String cond_code_n;
  String cond_txt_d;
  String cond_txt_n;
  String date;
  String hum;
  String mr;
  String ms;
  String pcpn;
  String pop;
  String pres;
  String sr;
  String ss;
  String tmp_max;
  String tmp_min;
  String uv_index;
  String vis;
  String wind_deg;
  String wind_dir;
  String wind_sc;
  String wind_spd;

  DailyForecast({this.cond_code_d, this.cond_code_n, this.cond_txt_d,
    this.cond_txt_n, this.date, this.hum, this.mr, this.ms, this.pcpn,
    this.pop, this.pres, this.sr, this.ss, this.tmp_max, this.tmp_min,
    this.uv_index, this.vis, this.wind_deg, this.wind_dir, this.wind_sc,
    this.wind_spd});

  factory DailyForecast.jsonToBean(Map<String, dynamic> json){
    return DailyForecast(
      cond_code_d: json['cond_code_d'],
      cond_code_n: json['cond_code_n'],
      cond_txt_d: json['cond_txt_d'],
      cond_txt_n: json['cond_txt_n:'],
      date: json['date'],
      hum: json['hum'],
      mr: json['mr'],
      ms: json['ms'],
      pcpn: json['pcpn'],
      pop: json['pop'],
      pres: json['pres'],
      sr: json['sr'],
      ss: json['ss'],
      tmp_max: json['tmp_max'],
      tmp_min: json['tmp_min'],
      uv_index: json['uv_index'],
      vis: json['vis'],
      wind_deg: json['wind_deg'],
      wind_dir: json['wind_dir'],
      wind_sc: json['wind_sc'],
      wind_spd: json['wind_spd'],
    );
  }
}


class City {
  String status;
  List<BasicOfCity> basic;

  City({this.status, this.basic});


  factory City.jsonToBean(Map<String, dynamic> json){
    List list = json['basic'] as List;
    List<BasicOfCity> listData = list.map((v) {
      return BasicOfCity.jsonToBean(v);
    }).toList();
    return City(
        status: json['status'],
        basic: listData
    );
  }


}


class BasicOfCity {
  String cid;
  String location;
  String parent_city;
  String admin_area;
  String cnty;
  String lat;
  String lon;
  String tz;
  String type;

  BasicOfCity({this.cid, this.location, this.parent_city, this.admin_area,
    this.cnty, this.lat, this.lon, this.tz, this.type});


  factory BasicOfCity.jsonToBean(Map<String, dynamic>json){
    return BasicOfCity(
        cid: json['cid'],
        location: json['location'],
        parent_city: json['parent_city'],
        admin_area: json['admin_area'],
        cnty: json['cnty'],
        lat: json['lat'],
        lon: json['lon'],
        tz: json['tz'],
        type: json['type']
    );
  }


}


















