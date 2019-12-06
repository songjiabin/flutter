import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//时间筛选的控件
class TimeSelectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    ShapeBorder shapeStyle1 = const RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(0),
        ));

    return new Container(
      height: 33,
        decoration: new BoxDecoration(
          color: Colors.red,
          //边框
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        margin: EdgeInsets.only(left: 32, right: 32, top: 25, bottom: 25),
        child: new Row(
          children: [
            getItemWidget(),
            getItemWidget(),
            getItemWidget(),
            getItemWidget()
          ],
        ));
  }

  Widget getItemWidget() {
    return Expanded(
        child: Text(
      '宋佳宾',
      textAlign: TextAlign.center,
    ));
  }
}
