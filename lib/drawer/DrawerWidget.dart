import 'package:flutter/material.dart';
import 'package:flutter_github/drawer/DrawerItemWidget.dart';
import 'package:flutter_github/main.dart';
import 'package:flutter_github/instance_demo/MyListViewDemo.dart'
as MyListViewDemo;
import 'package:flutter_github/instance_demo/MySelfDemo.dart' as MyselfDemo;
import 'package:flutter_github/echo_demo/MessageListScreen.dart' as MessageListScreen;
import 'package:flutter_github/example_demo/bottom_navigation_widget.dart';
import 'package:flutter_github/example_demo2/bottom_appbar.dart';
import 'package:flutter_github/example_demo3/pages.dart' as FirstWidgets;
import 'package:flutter_github/example_demo4/FrostedGlass.dart';
import 'package:flutter_github/example_demo5/KeepAliveDemo.dart';
import 'package:flutter_github/example_demo6/SearchWidget.dart';
import 'package:flutter_github/example_demo7/WarpWidget.dart';
import 'package:flutter_github/example_demo8/ExpansionTitleDemo.dart';
import 'package:flutter_github/example_demo9/ExpansionTitleList.dart';
import 'package:flutter_github/example_demo10/CustomBesselWidget.dart';
import 'package:flutter_github/example_demo11/CustomBesselComplexWidget.dart';
import 'package:flutter_github/example_demo12/SplashScreen.dart';
import 'package:flutter_github/example_demo13/RightBackWidget.dart';
import 'package:flutter_github/example_demo14/ToolTipsWidget.dart';
import 'package:flutter_github/example_demo15/DargTargetWidget.dart';
import 'package:flutter_github/login/Login.dart';
import 'package:flutter_github/chipWidget/ChipWidget.dart';
import 'package:flutter_github/animation/AnimWidget.dart';
import 'package:flutter_github/animation/OtherAnimWidget.dart';
import 'package:flutter_github/animation/CustomAnimation.dart';
import 'package:flutter_github/io/IoDemo.dart';
import 'package:flutter_github/json/JsonWidget.dart';
import 'package:flutter_github/json/JsonToBeanWidget.dart';
import 'package:flutter_github/http/HttpDemo.dart';
import 'package:flutter_github/movie/MovieWidget.dart';
import 'package:flutter_github/parsejson/ParseJsonWidget1.dart';
import 'package:flutter_github/parsejson/ParseJsonWidget2.dart';
import 'package:flutter_github/parsejson/ParseJsonWidget3.dart';
import 'package:flutter_github/parsejson/ParseJsonWidget4.dart';
import 'package:flutter_github/parsejson/ParseJsonWidget5.dart';
import 'package:flutter_github/parsejson/ParseJsonWidget6.dart';
import 'package:flutter_github/parsejson/ParseJsonWidget7.dart';
import 'package:flutter_github/parsejson/ParseJsonWidget8.dart';
import 'package:flutter_github/github/movie_details_page.dart';
import 'package:flutter_github/github/movie_api.dart';
import 'package:flutter_github/github_demo/MoviePosterWidget.dart';
import 'package:flutter_github/zhihu/ZhiHuWidget.dart';
import 'package:flutter_github/zhihu/ZhiHuWidget2.dart';
import 'package:flutter_github/map/map.dart';
import 'package:flutter_github/map/KeyWidget.dart';
import 'package:flutter_github/crossplatform/CrossPlatformWidget.dart';


/**
 * 侧滑菜单
 */
class DrawerWidget extends StatefulWidget {

  final ShowType showType;


  @override
  DrawerWidgetState createState() => new DrawerWidgetState();

  DrawerWidget(this.showType);
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
    if (this.widget.showType == ShowType.SampleWidget) {
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
      this.map['标签'] = ChipWidget();
      this.map['线性动画'] = AnimWidget();
      this.map['非线性动画'] = OtherAnimWidget();
      this.map['自定义动画'] = CustomAnimation();
      this.map['文件io操作'] = IoWidget();
      this.map['对象=>Json'] = JsonWidget();
      this.map['json=>对象'] = JsonToBeanWidget();
      this.map['解析json'] = ParseJsonWidget();
      this.map['解析json2'] = ParseJsonWidget2();
      this.map['解析json3'] = ParseJsonWidget3();
      this.map['解析json4'] = ParseJsonWidget4();
      this.map['解析json5'] = ParseJsonWidget5();
      this.map['解析json6'] = ParseJsonWidget6();
      this.map['解析Movie=>json'] = ParseJsonWidget7();
      this.map['解析Movie2=>json'] = ParseJsonWidget8();
      this.map['http'] = HttpDemoWidget();
      this.map['页面中map的使用'] = MapWidget();
      this.map['使用widget 的 标识属性 key'] = KeyWidget();
    } else if (this.widget.showType == ShowType.SampleDemo) {
      this.map['底部导航栏'] = bottom_navigation_widget();
      this.map['底部导航栏（特殊样式）+ 自定义的page界面'] = bottomAppbar();
      this.map['路由动画'] = FirstWidgets.FirstWidget();
      this.map['毛玻璃效果'] = FrostedGlassWidget();
      this.map['保存页面状态'] = KeepAliveDemo();
      this.map['搜索条'] = SearchWidget();
      this.map['流式布局'] = WrapWidget();
      this.map['展开闭合案例  ExpansionTile'] = ExpansionTitleDemo();
      this.map['可展开闭合的List'] = ExpansionTitleList();
      this.map['贝塞尔曲线'] = CustomBesselWidget();
      this.map['复杂的贝塞尔曲线'] = CustomBesselComplexWidget();
      this.map['欢迎界面 闪屏界面'] = SplashScreenWidget();
      this.map['右滑返回上一页'] = RightBackWidget();
      this.map['轻量级提示'] = ToolTipsWidget();
      this.map['滑动拖动控件'] = DargTargetWidget();
      this.map['实现一个listView的小Demo'] = MyListViewDemo.MyListViewDemo();
      this.map['静态界面'] = MyselfDemo.MySelfDemoWidget();
    } else if (this.widget.showType == ShowType.SampleProject) {
      this.map['实现一个echo客户端'] = MessageListScreen.MessageListScreen();
      this.map['登录'] = LoginWidget();
      this.map['movie'] = MovieWidget();
      this.map['美丽的电影海报'] = MovieDetailsPage(testMovie);
      this.map['美丽的电影海报Self'] = MoviePosterWidget();
      this.map['请求知乎接口的一个小例子'] = FutureBuilderPage();
      this.map['请求知乎接口的一个小例子2'] = ZhihuWidget2();
    } else if (this.widget == ShowType.CrossPlatform) {
      //跨平台
      this.map['得到'] = CrossPlatforWidget();
    }


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


enum ShowType {
  //常见控件
  SampleWidget,
  //小Demo
  SampleDemo,
  //小实例
  SampleProject,
  //跨平台
  CrossPlatform
}









