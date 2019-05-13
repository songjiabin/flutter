import 'package:flutter/material.dart';
import 'package:flutter_github/bean/ListViewBeanDemo.dart';

/**
 * MyListView item实例
 */
class MyListViewItemDemo extends StatelessWidget {
  final int position;
  final ListViewDemo _listViewDemo;
  final onItemClickListener _clickListener;

  MyListViewItemDemo(this.position, this._listViewDemo, this._clickListener);

  @override
  Widget build(BuildContext context) {
    //左边的图标
    final iconWidget = Icon(this._listViewDemo.buildType == BuildType.apple
        ? Icons.apps
        : Icons.filter_b_and_w);

    //右边的两个Text
    final widget = new Row(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          child: iconWidget,
        ),
        //右边的两个Text
        Expanded(
          child: Padding(
              padding: new EdgeInsets.all(8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    this._listViewDemo.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text('这个是地址，这样真的好吗？')
                ],
              )),
        ),
      ],
    );

    //添加点击效果
    // 一般的情况下，用 GestureDetector 监听手势
    var getstureDetecotor = new GestureDetector(
      //单机事件
      onTap: () {
        _clickListener(position);
      },
      child: widget,
    );
    return getstureDetecotor;
  }
}

/**
 * 定义一个接口  回调方法
 */
typedef onItemClickListener = void Function(int position);
