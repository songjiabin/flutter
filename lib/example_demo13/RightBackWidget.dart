import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/**
 * 右滑返回上一页
 */
class RightBackWidget extends StatefulWidget {
  @override
  RightBackWidgetState createState() => new RightBackWidgetState();
}

class RightBackWidgetState extends State<RightBackWidget> {
  @override
  Widget build(BuildContext context) {
    // cupertino 下的Scaffold
    return new CupertinoPageScaffold(

        child: new Center(
          child: new Container(
            //宽度
            width: 100.0,
            //高度
            height: 100.0,
            color: CupertinoColors.destructiveRed,
            child: CupertinoButton(child: Icon(CupertinoIcons.add),
                onPressed: () {
                  Navigator.push(context,
                      new CupertinoPageRoute(builder: (BuildContext context) {
                        return RightBackWidget();
                      }));
                }),
          ),
        ));
  }
}