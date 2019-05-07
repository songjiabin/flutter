import 'package:flutter/material.dart';

/**
 * 保持页面状态 详细的page界面
 */
class KeepAliveDemoPage extends StatefulWidget {
  @override
  KeepAliveDemoPageState createState() => new KeepAliveDemoPageState();
}

class KeepAliveDemoPageState extends State<KeepAliveDemoPage>
    with AutomaticKeepAliveClientMixin {

  //计数器
  int _count = 0;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _addCounter,
          tooltip: '点击',
          child: Icon(Icons.add),
        ),
        body: new Center(
          child: new Column(
            //主轴对齐
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('点一次增加一个数字'),
              new Text('$_count', style: Theme
                  .of(context)
                  .textTheme
                  .display1),

            ],
          ),
        )
    );
  }

  /**
   * 保持默认的状态
   */
  @override
  bool get wantKeepAlive => true;

  /**
   * 进行计数
   */
  void _addCounter() {
    setState(() {
      this._count++;
    });
  }


}