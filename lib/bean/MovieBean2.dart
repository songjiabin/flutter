import 'dart:convert';

class Movie2 {

  final String title;
  final String img;
  final String directors; //导演
  final String casts; //演员
  final String durations; //时长
  final String type;
  final String createCountry; //制作的国家
  final String average; //评分


  Movie2({this.title, this.img, this.directors, this.casts, this.durations,
    this.type, this.createCountry, this.average});


  // json --> bean
  static List<Movie2> jsonToBean(String jsonData) {
    List<Movie2> movieList = [];


    //解析json
    var jsonstr = json.decode(jsonData);
    //得到 List
    var subjectsList = jsonstr['subjects'];

    //遍历
    for (var sub in subjectsList) {
      var title = sub['title'];
      var img = sub['alt'];

      //导演
      var director = "";
      for (var dire in sub['directors']) {
        director += dire['name'] + "/";
      }

      //演员
      var casts = "";
      for (var cast in sub['casts']) {
        casts += cast['name'] + "/";
      }


      //时长
      var durations = "";
      for (var duration in sub['durations']) {
        durations += duration + "/";
      }


      //type
      var types = "";
      for (var type in sub['genres']) {
        types += type + "/";
      }

      //制作的国家
      var createCountrys = "";
      for (var createCountry in sub['pubdates']) {
        createCountrys += createCountry + '/';
      }


      var average = sub['rating']['average'].toString();


      Movie2 movie = Movie2(
        title: title,
        img: img,
        directors: director,
        casts: casts,
        durations: durations,
        type: types,
        createCountry: createCountrys,
        average: average,

      );
      movieList.add(movie);
    }


    return movieList;
  }
}


