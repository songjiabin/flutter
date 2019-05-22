class Movie {

  final int start;
  final int total;
  final int count;
  final String title;
  final List<Subjects> subjects;

  Movie({this.start, this.total, this.count, this.subjects, this.title});


  factory Movie.jsonToBean(Map<String, dynamic> json){
    // 因为是个数组 所以我们要将subjects先转出数组格式
    List subJectsList = json['subjects'] as List;
    //将里面的数据转出List<Subjects> 格式
    List<Subjects> list = subJectsList.map((i) => Subjects.jsonToBean(i))
        .toList();


    return Movie(
        total: json['total'],
        start: json['start'],
        count: json['count'],
        title: json['title'],
        subjects: list
    );
  }
}


class Subjects {

  final Rating rating;
  final List<String> genres;
  final String title;
  final List<Casts> casts;
  final List<String> durations;
  final int collect_count;
  final String mainland_pubdate;
  final bool has_video;
  final String original_title;
  final String subtype;
  final List<Directors> directors;
  final List<String> pubdates;
  final String year;
  final Avatars images;
  final String alt;
  final String id;

  Subjects(
      {this.rating, this.genres, this.title, this.casts, this.durations, this.collect_count, this.mainland_pubdate, this.has_video, this.original_title, this.subtype, this.directors, this.pubdates, this.year, this.images, this.alt, this.id});


  factory Subjects.jsonToBean(Map<String, dynamic> json){
    //转换成List<string>
    List genresStringList = json['genres'].cast<String>();


    List casts = json['casts'] as List;
    List<Casts> castsList = casts.map((i) => Casts.jsonToBean(i)).toList();


    json['durations'].cast<String>() as List<String>;


    return Subjects(
        title: json['title'],
        collect_count: json['collect_count'],
        mainland_pubdate: json['mainland_pubdate'],
        original_title: json['original_title'],
        subtype: json['subtype'],
        year: json['year'],
        alt: json['alt'],
        id: json['id'],
        rating: Rating.jsonToBean(json['rating']),
        genres: genresStringList,
        casts: castsList,
        durations: json['durations'].cast<String>() as List<String>,
        has_video: json['has_video'],
        directors: (json['directors'] as List).map((i) =>
            Directors.jsonToBean(i)).toList(),
        pubdates: json['pubdates'].cast<String>() as List,
        images: Avatars.jsonToBean(json['images'])

    );
  }


}


class Rating {
  final int max;
  final String average;
  final String stars;
  final int min;

  Rating({this.max, this.average, this.stars, this.min});


  factory Rating.jsonToBean(Map<String, dynamic> json){
    String avdr = json['average'].toString();


    return Rating(
      max: json['max'],
      average: avdr,
      stars: json['stars'],
      min: json['min'],
    );
  }


}

class Casts {
  final String id;
  final String alt;
  final String name;
  final String name_en;
  final Avatars avatars;

  Casts({this.id, this.alt, this.name, this.name_en, this.avatars});

  factory Casts.jsonToBean(Map<String, dynamic> json){
    return Casts(
        id: json['id'],
        alt: json['alt'],
        name: json['name'],
        name_en: json['name_en'],
        avatars: Avatars.jsonToBean(json['avatars'])
    );
  }

}

class Avatars {
  final String small;
  final String large;
  final String medium;

  Avatars({this.small, this.large, this.medium});


  factory Avatars.jsonToBean(Map<String, dynamic> json){
    return Avatars(
      small: json['small'],
      large: json['large'],
      medium: json['medium'],
    );
  }


}

class Directors {
  final Avatars avatars;
  final String name_en;
  final String name;
  final String alt;
  final String id;

  Directors({this.avatars, this.name_en, this.name, this.alt, this.id});


  factory Directors.jsonToBean(Map<String, dynamic> json){
    return Directors(
        name: json['name'],
        name_en: json['name_en'],
        alt: json['alt'],
        id: json['id'],
        avatars: Avatars.jsonToBean(json['avatars'])
    );
  }


}



