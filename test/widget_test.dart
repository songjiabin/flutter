// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:io';

class demo{

  //构造方法
  demo._insernal(){
    print('11111ddddd');
  }
  static demo _instance;

  static demo _getInstance(){
    if(_instance==null) {
        _instance=demo._insernal();
      }
    return _instance;
  }


  factory demo() =>_getInstance();

}



void main() {

//  print(demo._getInstance());


  demo d =new demo();

}

