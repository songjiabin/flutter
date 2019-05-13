import 'package:flutter/material.dart';
import 'package:flutter_github/drawer/DrawerItemWidget.dart';
import 'package:flutter_github/main.dart';


/**
 * 侧滑菜单
 */
class DrawerWidget extends StatefulWidget {
  @override
  DrawerWidgetState createState() => new DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {

  String title;
  Map<String, Widget> map = Map();
  final List<String> drawerList = [];

  @override
  void initState() {
    super.initState();
    initMapData();
    this.title = drawerList[0];
  }


  /**
   * 初始化数据
   */
  void initMapData() {
    this.map['hello world'] = HelloWorldApp();
    this.map['Container模块'] = ContainerApp();
    this.map['image 图片'] = ImageApp();
    this.map['listView 列表 纵向'] = ListViewApp();
    this.map['横线的ListView'] = ListViewHorizontalApp();
    this.map['动态的listView'] =
    new DynamicListViewApp(item: List.generate(100, (i) => 'item-->$i'));
    this.map['网格列表'] = GridViewApp();
    this.map['水平布局'] = LevelLayoutWidget();
    this.map['垂直布局'] = VerticalLayoutWidget();
    this.map['层叠布局'] = CascadingLayoutWidget();
    this.map['定位布局 适应于三个以上控件的定位'] = PositionLayoutWidget();
    this.map['卡片式布局'] = cardLayoutWidget();
    this.map['界面间的跳转'] = FirstWidget();
//    this.map['直接跳转到其他的.dart文件中去'] = MainApp();
    this.map['导航参数的传递和接收'] = IntentWidget();
    this.map['界面跳转并返回'] = returnDataWidget();
    this.map['本地图片'] = locationImage();
    this.map['打包'] = new Center(child: Text(
        '详见https://jjmima.top/2019/04/26/Flutter%20%E6%89%93%E5%8C%85/#more'));
    this.map['常用的button'] = sampleButton();
    this.map['文本输入框'] = MessageForm();
    this.map['显示弹框'] = new MaterialApp(home: DialogWidget());


    map.forEach((key, value) {
      drawerList.add(key);
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: new Drawer(

          //创建不同类型的ListView
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                var drawerItemWidget = DrawerItemWidget(
                    this.drawerList[index], index, (position) {
                  setState(() {
                    title = this.drawerList[position];
                  });
                });
                return drawerItemWidget;
              },

              itemCount: this.drawerList.length,
              //可用于显示分割线
              separatorBuilder: (content, index) {
                return Divider(height: 1.0, color: Colors.orange,);
              }
          ),

        ),
        body:
        this.map[title]
    );
  }
}











