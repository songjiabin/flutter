class Movie {

  String title;
  String average;


  Movie({this.title, this.average});

  /**
   * 将json变为实体
   */
  factory Movie.fromJson(Map<String, dynamic> parsedJson){
    return Movie(
        title: parsedJson['title'],
        average: parsedJson['average']);
  }

}




