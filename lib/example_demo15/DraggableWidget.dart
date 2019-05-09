import 'package:flutter/material.dart';

/**
 * 滑动拖动控件
 */
class DraggableWidget extends StatefulWidget {


  final Offset offset;
  final Color color;


  DraggableWidget({Key key, this.offset, this.color}) :super(key: key);

  @override
  DraggableWidgetState createState() => new DraggableWidgetState();
}

class DraggableWidgetState extends State<DraggableWidget> {

  Offset offset = new Offset(0, 0);


  @override
  void initState() {
    super.initState();
    //将构造方法传过来的offset传递过来
    offset = this.widget.offset;
  }


  @override
  Widget build(BuildContext context) {
    return
      //位置的参数
      new Positioned(
        child:
        //可以拖动的控件
        new Draggable(
          //传递过来的 数据(拖动的时候要传递给接收器的数据)  这里是颜色
          data: this.widget.color,
          child: new Container(
            //宽度
              width: 100.0,
              //高度
              height: 100.0,
              color: this.widget.color
          ),
          //当我们拖动的时候 此元素的样子
          feedback: new Container(
            //宽度
            width: 100.0,
            //高度
            height: 100.0,
            //当拖动的还是 让被拖动的控件具有半透明的效果
            color: this.widget.color.withOpacity(0.5),
          ),
          //当松手的时候
          onDraggableCanceled: (Velocity velocity, Offset offset) {
            //这个时候要改变位置了就
            setState(() {
              this.offset = offset;
            });
          },
        ),
        left: offset.dx,
        top: offset.dy,
      );
  }


}




