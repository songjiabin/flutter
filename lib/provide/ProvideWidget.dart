import 'package:flutter/material.dart';
import 'package:flutter_github/provide/Counter.dart';
import 'package:provider/provider.dart';

class ProvideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getWidget(context);
  }

  Widget getWidget(BuildContext context) {
    //获取Provider对象
    var conterProcider = Provider.of<Counter>(context);
    return new Center(
        child: FlatButton(
          onPressed: null,
          child: new Center(
              child: FlatButton(
                onPressed: () => conterProcider.inCount(),
                child: Text('用户页面点击count--->${conterProcider.count}', style: TextStyle(fontSize: 20)),
              )),
        ));
  }
}
