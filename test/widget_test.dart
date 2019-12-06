// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:date_format/date_format.dart';
import 'package:flutter_github/cupertino_date_picker/lib/date_picker.dart';

void main() {
  var now = DateTime.now();

  DateTime dateTime = now.subtract(new Duration(days: 1));
  print("---------->" + formatDate(dateTime, [yyyy, '-', mm, '-', dd]));

  String date = "2019-12-06";
  String date2 = "2019-12-05";

   var iss = DateTime.parse(date).isBefore(DateTime.parse(date2));

  print("---------->" +iss.toString());
}
