import 'package:flutter/material.dart';
import 'package:flutter_github/example_demo2/EachWidget.dart';

class bottomAppbar extends StatefulWidget {
  @override
  bottomAppbarState createState() => new bottomAppbarState();
}

class bottomAppbarState extends State<bottomAppbar> {

  int _currentindex = 0;

  List<Widget> listWidget = [];


  @override
  void initState() {
    super.initState();
    this.listWidget..add(EachWidget('首页'))..add(EachWidget('第二页'));
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('底部导航栏'),
      ),
      body: new Scaffold(
        floatingActionButton: new FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (BuildContext context) {
                    return new EachWidget('each page');
                  }));
            },
            tooltip: '长恩出来',
            child: Icon(Icons.add, color: Colors.red,)
        ),
        //底部工具栏
        bottomNavigationBar: new BottomAppBar(
          color: Colors.lightBlue,
          //缺口 和 floatingActionButton 相融合
          shape: new CircularNotchedRectangle(),
          child: Row(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.home, color: Colors.white,),
                  onPressed: () {
                    setState(() {
                      this._currentindex = 0;
                    });
                  }),
              new IconButton(
                  icon: Icon(Icons.image, color: Colors.white), onPressed: () {
                setState(() {
                  this._currentindex = 1;
                });
              }),
            ],
            //主轴大小
            mainAxisSize: MainAxisSize.min,
            //主轴的对齐方式
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
        body: this.listWidget[this._currentindex],
        //融合的方式
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}