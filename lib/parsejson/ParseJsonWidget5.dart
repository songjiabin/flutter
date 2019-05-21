import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/**
 * 解析json  解析{}数据
 */
class ParseJsonWidget5 extends StatefulWidget {
  @override
  ParseJsonWidgetState createState() => new ParseJsonWidgetState();
}

class ParseJsonWidgetState extends State<ParseJsonWidget5> {

  PhotoList _photoList;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text(_photoList.toString()),
    );
  }

  @override
  void initState() {
    super.initState();
    loadProduct();
  }


  /**
   * 加载assdt json数据
   */
  Future<String> loadAsset() async {
    Future<String> result = rootBundle.loadString('assets/photo.json');
    return result;
  }


  /**
   * 加载学生数据
   */
  loadProduct() async {
    loadAsset().then((String content) {
      final jsonResponse = json.decode(content);
      setState(() {
        _photoList = PhotoList.jsonToBean(jsonResponse);
      });
    });
  }
}


/**
 *[
    {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "http://placehold.it/600/92c952",
    "thumbnailUrl": "http://placehold.it/150/92c952"
    },
    {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "http://placehold.it/600/771796",
    "thumbnailUrl": "http://placehold.it/150/771796"
    },
    {
    "albumId": 1,
    "id": 3,
    "title": "officia porro iure quia iusto qui ipsa ut modi",
    "url": "http://placehold.it/600/24f355",
    "thumbnailUrl": "http://placehold.it/150/24f355"
    }
    ]


 */


class PhotoList {

  final List<Photo> photo;

  PhotoList({this.photo});

  factory PhotoList.jsonToBean(List<dynamic> json){
    List<Photo> listPhoto = json.map((i) => Photo.jsonToBean(i)).toList();

    return PhotoList(
        photo: listPhoto
    );
  }


  @override
  String toString() {
    return 'PhotoList{photo:${photo.toString()}';
  }

}

class Photo {

  final int albumId;
  final int id;
  final String title;
  final String url;
  final thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});


  factory Photo.jsonToBean(Map<String, dynamic> json){
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }


  @override
  String toString() {
    return 'photo{albumId:$albumId,id:$id,title:$title,url:$url,thumbnailUrl$thumbnailUrl}';
  }


}










