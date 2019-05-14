import 'package:flutter/material.dart';
import 'package:flutter_github/bean/ListViewBeanDemo.dart';
import 'package:flutter_github/instance_demo/MyListViewItemDemo.dart'
    as MyListViewItemDemo;

/**
 * MyListView 实例
 */
class MyListViewDemo extends StatelessWidget {
  /**
   * 获取数据
   */
  List<ListViewDemo> getListViewData() {
    List<ListViewDemo> listDemo = [];
    for (int i = 0; i < 100; i++) {
      ListViewDemo listView;
      if (i % 2 == 0) {
        listView = new ListViewDemo(BuildType.apple, '苹果');
      } else {
        listView = new ListViewDemo(BuildType.banana, '大鸭梨');
      }
      listDemo.add(listView);
    }
    return listDemo;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return MyListViewItemDemo.MyListViewItemDemo(
                index, getListViewData()[index], (position) {
              return print('回调方法点击事件？$position');
            });
          },
          itemCount: getListViewData().length,
        ));
  }
}
