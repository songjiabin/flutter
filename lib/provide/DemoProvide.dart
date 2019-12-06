import 'package:flutter/material.dart';

class DemoProvide with ChangeNotifier{

  int _count = 0;

  int get count => _count;

  Function inCount() {
    print(_count);
    this._count++;
    //表示更新状态.它会重新触发所有监听了该Provider的类的build方法
    //在本例中，当notifyListeners方法执行的时候，购物车页面与我的页面的build方法都会被重新触发
    notifyListeners();
  }

}
