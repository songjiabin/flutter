import 'package:flutter/material.dart';

/**
 * 长按提示 （轻量级）
 */
class ToolTipsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('长按提示 （轻量级）'),
      ),
      body: new Center(
        child: new Container(
          //宽度
          width: 500.0,
          //高度
          height: 500.0,
          color: Colors.lightBlue,
          child:
          //长按提示的控件
          Tooltip(
              message: '长按我给的提示哦',
              child: Image.network(
                  'https://images.unsplash.com/photo-1557254365-5ec69f01cd79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.cover,
              )
          ),

        ),
      ),
    );
  }
}