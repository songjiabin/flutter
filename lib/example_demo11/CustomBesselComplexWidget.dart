import 'package:flutter/material.dart';

/**
 * 复杂的贝塞尔曲线
 */
class CustomBesselComplexWidget extends StatefulWidget {
  @override
  CustomBesselComplexWidgetState createState() =>
      new CustomBesselComplexWidgetState();
}

class CustomBesselComplexWidgetState extends State<CustomBesselComplexWidget> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('复杂的贝塞尔曲线'),
        ),
        body:
        new Column(
          children: <Widget>[
            //按路径裁切的组件
            new ClipPath(
              //要裁切的路径
              clipper: BottomClipper(),
              child: new Container(
                color: Colors.red,
                //高度
                height: 400.0,
              ),
            )
          ],
        )
    );
  }

}


class BottomClipper extends CustomClipper<Path> {

  //次  size 为 child 得到的大小
  @override
  Path getClip(Size size) {
    var path = Path();
    //第一个点
    path.lineTo(0, 0);
    //第二个点
    path.lineTo(0, size.height - 50);

    //第一个控制点
    var firstControlPoint = Offset(size.width / 4, size.height);
    //第一个结束点
    var firstControlEnd = Offset(size.width / 2.25, size.height - 40);


    /**
     *  x1: 控制点 X
     *  y1: 控制点Y
     *
     *  x2:结束点X
     *  y2:结束点y
     */
    //做曲线
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstControlEnd.dx,
        firstControlEnd.dy);


    //第二个控制点
    var secondControlPoint = Offset(size.width / 4 * 3, size.height - 90);
    //第二个结束点
    var secondControlEnd = Offset(size.width, size.height - 40);



    //做曲线
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondControlEnd.dx,
        secondControlEnd.dy);



    //第三个点
    path.lineTo(size.width, size.height - 40);
    //第四个点
    path.lineTo(size.width, 0);


    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}
