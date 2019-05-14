import 'package:flutter/material.dart';
import 'package:flutter_github/main.dart';
import 'package:flutter_github/example_demo/home.dart';
import 'package:flutter_github/example_demo/contact.dart';
import 'package:flutter_github/example_demo/description.dart';
import 'package:flutter_github/example_demo/battery.dart';

/**
 * 底部导航栏
 */
class bottom_navigation_widget extends StatefulWidget {
  @override
  _bottom_navigation_widgetState createState() =>
      new _bottom_navigation_widgetState();
}


class _bottom_navigation_widgetState extends State<bottom_navigation_widget> {

  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> listWidget = [];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      //底部导航
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _bottomNavigationColor,),
              title: new Text(
                  '首页', style: TextStyle(color: _bottomNavigationColor))),
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_box, color: _bottomNavigationColor,),
            title: new Text(
                '联系人', style: TextStyle(color: _bottomNavigationColor)),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.description, color: _bottomNavigationColor,),
            title: new Text(
                '描述', style: TextStyle(color: _bottomNavigationColor)),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.battery_std, color: _bottomNavigationColor,),
            title: new Text(
                '电量', style: TextStyle(color: _bottomNavigationColor)),
          )
        ],
        //点击相应事件
        onTap: (int position) {
          //设置状态
          setState(() {
            this._currentIndex = position;
          });
          print(position);
        },
        //当前的目标index  导航的索引  哪个被选中，哪个高亮
        currentIndex: this._currentIndex,
      ),
      body: this.listWidget[this._currentIndex],
    );
  }

  @override
  void initState() {
    super.initState();
    listWidget..add(homeWidget())..add(contactWidget())..add(
        descriptionWidget())..add(batteryWidget());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(bottom_navigation_widget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
