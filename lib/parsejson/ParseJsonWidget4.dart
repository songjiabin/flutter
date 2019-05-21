import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/**
 * 解析json  解析{}数据
 */
class ParseJsonWidget4 extends StatefulWidget {
  @override
  ParseJsonWidgetState createState() => new ParseJsonWidgetState();
}

class ParseJsonWidgetState extends State<ParseJsonWidget4> {

  Product _product;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text(_product.toString()),
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
    Future<String> result = rootBundle.loadString('assets/product.json');
    return result;
  }


  /**
   * 加载学生数据
   */
  loadProduct() async {
    loadAsset().then((String content) {
      final jsonResponse = json.decode(content);
      setState(() {
        _product = Product.JsonToBean(jsonResponse);
      });
    });
  }
}


/**
 * {
    "id":1,
    "name":"ProductName",
    "images":[
    {
    "id":11,
    "imageName":"xCh-rhy"
    },
    {
    "id":31,
    "imageName":"fjs-eun"
    }
    ]
    }
 */

class Product {

  final int id;
  final String name;
  final List<Images> images;

  Product({this.id, this.name, this.images});


  factory Product.JsonToBean(Map<String, dynamic> json){
    var listImages = json['images'] as List;

    List<Images> list = listImages.map((i) => Images.JsonToBean(i)).toList();


    return Product(
        id: json['id'],
        name: json['name'],
        images: list
    );
  }

  @override
  String toString() {
    return 'product{id:$id,name:$name,images:${images.toString()}';
  }
}


class Images {
  final int id;
  final String imageName;

  Images({this.id, this.imageName});

  factory Images.JsonToBean(Map<String, dynamic> json){
    return new Images(
        id: json['id'],
        imageName: json['imageName']
    );
  }

  @override
  String toString() {
    return "Images{id:$id,imageName:$imageName}";
  }
}





