import 'package:flutter/material.dart';


/**
 * 自定义的Image Title
 */
class CustomerImageTitle extends StatefulWidget {

  @override
  CustomerImageTitleState createState() => new CustomerImageTitleState();
}

class CustomerImageTitleState extends State<CustomerImageTitle> {

  double displayWidth;
  double displayHeight;


  @override
  Widget build(BuildContext context) {
    //屏幕的宽高
    final mediaQueryData = MediaQuery.of(context);
    //获取屏幕的宽高
    displayWidth = mediaQueryData.size.width;
    displayHeight = mediaQueryData.size.height;
    return
      //可裁切的路径
      ClipPath(
        child: Image.network(
          'https://cdn.pixabay.com/photo/2019/05/25/16/57/marigold-4228715__340.jpg',
          fit: BoxFit.cover,
          height: 250.0,
          width: displayWidth,
        ),
        //裁切
        clipper: MyCustomerImage(),
      );
  }

  @override
  void initState() {
    super.initState();
//    Future(initData);
  }


  initData() {
    //屏幕的宽高
    final mediaQueryData = MediaQuery.of(context);
    //获取屏幕的宽高
    displayWidth = mediaQueryData.size.width;
    displayHeight = mediaQueryData.size.height;
  }


}


class MyCustomerImage extends CustomClipper<Path> {

  /**
   * Size 为 ClipPath 中的 child 高度、宽度
   */
  @override
  Path getClip(Size size) {
    var path = Path();
    //将点移动到 img的最下面的那个点
    path.lineTo(0, size.height - 30);
    //第一个控制点
    var firstControlPoint = Offset(size.width / 4, size.height);
    //第一个点
    var firstPoint = Offset(size.width / 2, size.height);

    //做曲线
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);


    //第二个控制点
    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);

    //第二个点
    var secondPoint = Offset(size.width, size.height - 30);
    //画曲线
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);


    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}