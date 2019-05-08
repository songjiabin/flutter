import 'package:flutter/material.dart';

/**
 * wrap 流式布局
 */
class WrapWidget extends StatefulWidget {
  @override
  WrapWidgetState createState() => new WrapWidgetState();
}

class WrapWidgetState extends State<WrapWidget> {


  List<Widget> listWidget;


  @override
  void initState() {
    super.initState();
    listWidget = new List<Widget>()
      ..add(buildAddButton());
  }

  /**
   * 创建添加的按钮
   */
  Widget buildAddButton() {
    return
      //手势识别
      new GestureDetector(
        //单击事件
          onTap: () {
            setState(() {
              if (listWidget.length <= 9) {
                //如果ListWidget的长度小于9 那么添加照片
                this.listWidget.insert(
                    this.listWidget.length - 1, buildPhoto());
              }
            });
          },
          child:
          new Padding(padding: const EdgeInsets.all(10.0),
            child: new Container(
              //宽度
              width: 80.0,
              //高度
              height: 80.0,
              color: Colors.black12,
              child: IconButton(icon: Icon(Icons.add),
                  onPressed: null),
            ),
          )
      );
  }

  /**
   * 创建photo图片
   */
  Widget buildPhoto() {
    return Padding(padding: EdgeInsets.all(8.0),
      child: new Container(
        //宽度
        width: 80.0,
        //高度
        height: 80.0,
        child: new Center(
          child: Image.network(
              'https://cdn.pixabay.com/photo/2019/05/03/00/28/insect-4174863__340.jpg',fit: BoxFit.cover,),
        ),

      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //得到屏幕的宽度
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('流式布局'),
      ),
      body: new Center(
        child: new Opacity(opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child:
            //流式布局
            Wrap(
              children: this.listWidget,
              spacing: 26.0,
            ),
          ),
        ),
      ),
    );
  }
}