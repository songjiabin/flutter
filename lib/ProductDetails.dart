import 'package:flutter/material.dart';
import 'package:flutter_github/main.dart';
import 'package:flutter_github/bean/Product.dart';

void main() {
  runApp(
    new MaterialApp(
      title: '商品详情',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ProductDetails(),
    ),
  );
}

class ProductDetails extends StatelessWidget {

  final Product product;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBarWidget(name: '商品详情-->${this.product.title}'),
      body: new Center(
        child: new Text('商品详情${this.product.description}'),
      ),
    );
  }

  ProductDetails({Key key, Product this.product}) :super(key: key);
}