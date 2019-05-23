// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:io';

void main() {
  go();
  return;
}


void go() {
  var li = [1, 2, 3, 4, 5];
  li.forEach((i) =>
      print((i) {
        return i * i;
      }(i)));


  li.forEach((i) =>
      print((i) {

      }));


  var file = File(r"C:\Users\songjiabin1\Desktop\新建文本文档.txt");
  Future<String> re = file.readAsString();
  re.then((result) {
    print(result);
  });
  print("我是第几?");


  List abc = [];
  abc.add('1');
  abc.add('2');


  abc.map((i) => i + "宋").forEach((f){
    print(f);
  });
}


class demo {
  String name;

  demo(this.name);
}
