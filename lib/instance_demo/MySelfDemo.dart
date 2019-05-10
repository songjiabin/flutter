import 'package:flutter/material.dart';

/**
 * 实现一个小demo
 */
class MySelfDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: [
            new Image.network(
              'https://cdn.pixabay.com/photo/2019/04/21/11/11/chess-board-flowers-4143937__340.jpg',
              fit: BoxFit.cover,
            ),
            new Row(
              children: [
                new Text('这个是上标题'),
                new Text('这个是小标题')
              ],
            ),
          ],
        ),
      ),
    );
  }
}






