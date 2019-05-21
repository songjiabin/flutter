import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/**
 * 解析json  解析复杂的嵌套结构
 */
class ParseJsonWidget6 extends StatefulWidget {
  @override
  ParseJsonWidgetState createState() => new ParseJsonWidgetState();
}

class ParseJsonWidgetState extends State<ParseJsonWidget6> {

  Pages _pages;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text(_pages.toString(), style: TextStyle(fontSize: 20),),
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
    Future<String> result = rootBundle.loadString('assets/page.json');
    return result;
  }


  /**
   * 加载学生数据
   */
  loadProduct() async {
    loadAsset().then((String content) {
      final jsonResponse = json.decode(content);
      setState(() {
        _pages = Pages.jsonToBean(jsonResponse);
      });
    });
  }
}


/**
 * { "page": 1,
    "per_page": 3,
    "total": 12,
    "total_pages": 4,
    "author":{
    "first_name": "Ms R",
    "last_name":"Reddy"
    },
    "data": [
    {
    "id": 1,
    "first_name": "George",
    "last_name": "Bluth",
    "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg",
    "images": [
    {
    "id" : 122,
    "imageName": "377cjsahdh388.jpeg"
    },
    {
    "id" : 152,
    "imageName": "1743fsahdh388.jpeg"
    }
    ]

    },
    {
    "id": 2,
    "first_name": "Janet",
    "last_name": "Weaver",
    "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg",
    "images": [
    {
    "id" : 122,
    "imageName": "377cjsahdh388.jpeg"
    },
    {
    "id" : 152,
    "imageName": "1743fsahdh388.jpeg"
    }
    ]
    },
    {
    "id": 3,
    "first_name": "Emma",
    "last_name": "Wong",
    "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/olegpogodaev/128.jpg",
    "images": [
    {
    "id" : 122,
    "imageName": "377cjsahdh388.jpeg"
    },
    {
    "id" : 152,
    "imageName": "1743fsahdh388.jpeg"
    }
    ]
    }
    ]
    }
 *
 */


class Pages {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final Author author;
  final List<Data> data;

  Pages({this.page, this.per_page, this.total, this.total_pages, this.author,
    this.data});


  factory Pages.jsonToBean(Map<String, dynamic> json){
    List jsonDataList = json['data'] as List;
    List<Data> dataList = jsonDataList.map((i) => Data.jsonToBean(i)).toList();


    return Pages(
        page: json['page'],
        per_page: json['per_page'],
        total: json['total'],
        total_pages: json['total_pages'],
        author: Author.jsonToBean(json['author']),
        data: dataList
    );
  }

  @override
  String toString() {
    return 'Pages{page:$page,per_page:$per_page,total:$total,total_pages:$total_pages,author:${author
        .toString()},data:${data.toString()}';
  }
}


class Author {
  String first_name;
  String last_name;

  Author({this.first_name, this.last_name});


  factory Author.jsonToBean(Map<String, dynamic> json){
    return Author(
        first_name: json['first_name'],
        last_name: json['last_name']
    );
  }

  @override
  String toString() {
     return 'Author{first_name:$first_name,last_name:$last_name}';
  }

}

class Data {
  final int id;
  final String first_name;
  final String last_name;
  final String avatar;
  final List<Image> images;

  Data({this.id, this.first_name, this.last_name, this.avatar, this.images});


  factory Data.jsonToBean(Map<String, dynamic> json){
    List listImages = json['images'] as List;
    List<Image> listImage = listImages.map((i) => Image.jsonToBean(i)).toList();


    return Data(
        id: json['id'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar'],
        images: listImage
    );
  }

  @override
  String toString() {
    return 'Data{id:$id,firstName:$first_name,last_name:$last_name,avatar:$avatar,images:${images
        .toString()}';
  }


}

class Image {
  final int id;
  final String imageName;

  Image({this.id, this.imageName});

  factory Image.jsonToBean(Map<String, dynamic> json){
    return Image(
        id: json['id'],
        imageName: json['imageName']
    );
  }

  @override
  String toString() {
    return 'Image{id:$id,imageName:$imageName}';
  }


}









