import 'package:flutter_github/example_demo15/DargTargetWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/example_demo15/DraggableWidget.dart' as DraggableWidget;


/**
 * 拖动的时候的接收器
 */
class DargTargetWidget extends StatefulWidget {
  @override
  DargTargetWidgetState createState() => new DargTargetWidgetState();
}

class DargTargetWidgetState extends State<DargTargetWidget> {


  Color _dargTargetColor = Colors.grey;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Stack(
        children: <Widget>[
          DraggableWidget.DraggableWidget(
            offset: new Offset(80.0, 80.0), color: Colors.green,),
          DraggableWidget.DraggableWidget(
            offset: new Offset(180.0, 80.0), color: Colors.yellow,),
          new Center(
            child:
            //拖拽接收器
            DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return new Container(
                    //宽度
                    width: 200.0,
                    //高度
                    height: 200.0,

                    color: this._dargTargetColor,
                  );
                },
                //当拖拽到里面出发的事件
                onAccept: (Color color) {
                  this._dargTargetColor = color;
                }
            ),
          ),
        ],
      ),
    );
  }

}