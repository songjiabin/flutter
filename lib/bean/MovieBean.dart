class Movie {

  final int count;
  final int start;
  final int end;
  final String title;
  final List<Subjects> subjects;

  Movie({this.count, this.start, this.end, this.subjects, this.title});


  factory Movie.jsonToBean(Map<String, dynamic> json){
    List subJectsList = json['subjects'] as List;
    List<Subjects> list = subJectsList.map((i) => Subjects.jsonToBean(i))
        .toList();


    return Movie(
        count: json['count'],
        start: json['start'],
        end: json['end'],
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

    //转换成string
    List genresStringList = json['genres'].cast<String>();


    List casts = json['casts'] as List;
    List<Casts> castsList = casts.map((i) => Casts.jsonToBean(i)).toList();


    return Subjects(
      title: json['title'],
      collect_count: json['collect_count'],
      mainland_pubdate: json['mainland_pubdate'],
      original_title: json['original_title'],
      subtype: json['subtype'],
      year: json['year'],
      alt: json['alt'],
      id: json['id'],
//        rating: Rating.jsonToBean(json['rating']),
      genres: genresStringList,
//        casts: castsList,
//        durations: (json['durations'] as List).map((i) => i).toList(),
//        has_video: json['has_video'],
//        directors: (json['directors'] as List).map((i) =>
//            Directors.jsonToBean(i)).toList(),
//        pubdates: (json['pubdates'] as List).map((i) => i).toList(),
//        images: Avatars.jsonToBean(json['Avatars'])

    );
  }


}


class Rating {
  final int max;
  final double average;
  final String stars;
  final int min;

  Rating({this.max, this.average, this.stars, this.min});


  factory Rating.jsonToBean(Map<String, dynamic> json){
    return Rating(
      max: json['max'],
      average: json['average'],
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
  final List<Avatars> avatars;
  final String name_en;
  final String name;
  final String alt;
  final String id;

  Directors({this.avatars, this.name_en, this.name, this.alt, this.id});


  factory Directors.jsonToBean(Map<String, dynamic> json){
    List<Avatars> av = (json['avatars'] as List).map((i) =>
        Avatars.jsonToBean(i)).toList();

    return Directors(
        name: json['name'],
        name_en: json['name_en'],
        alt: json['alt'],
        id: json['id'],
        avatars: av
    );
  }


}



