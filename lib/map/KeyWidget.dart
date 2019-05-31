import 'package:flutter/material.dart';

/**
 * key参数的使用
 *
 * key进行标识当前widget
 *
 */
class KeyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: [
          Text('数据1', key: Key('数据1'),),
          Text('数据2'),
          Text('数据3'),
          Text('数据4'),
        ].map((Widget widget) {
          int flex;
          Color _color;
          if (widget.key == Key('数据1')) {
            flex = 1;
            _color = Colors.red;
          } else {
            flex = 2;
            _color = Colors.green;
          }
          return Expanded(
            child: new Container(
              width: 100.0,
              child: widget,
              color: _color,
            ),
            flex: flex,
          );
        }).toList(),
      ),
    );
  }
}