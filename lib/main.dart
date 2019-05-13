import 'package:flutter/material.dart';
import 'package:flutter_github/ProductDetails.dart';
import 'package:flutter_github/bean/Product.dart';
import 'package:flutter_github/example_demo15/DargTargetWidget.dart'
as DargTargetWidget;
import 'package:flutter_github/example_demo16/draggable_demo.dart';
import 'package:flutter_github/instance_demo/MyListViewDemo.dart'
as MyListViewDemo;
import 'package:flutter_github/instance_demo/MySelfDemo.dart' as MyselfDemo;
import 'package:flutter_github/echo_demo/MessageListScreen.dart' as MessageListScreen;

import 'package:flutter_github/drawer/DrawerWidget.dart' as DrawerWidget;
import 'package:flutter_github/drawer/DrawerMainWidet.dart';

void main() {
  runApp(getDrawerWidget());
}


//侧滑菜单

Widget getDrawerWidget() {
  return new MaterialApp(
      title: '侧滑菜单',
      home: DrawerMainWidget()
  );
}


/**
 * 实现一个echo客户端
 */
Widget getWidget_5() {
  return new MaterialApp(
      title: 'demo',
      home: MessageListScreen.MessageListScreen()
  );
}


/**
 * 实现一个listView的小Demo
 */
Widget getWidget_4() {
  return new MaterialApp(title: 'demo', home: MyListViewDemo.MyListViewDemo());
}

/**
 * 小实例demo
 */
Widget getWidget_3() {
  return new MaterialApp(title: 'Demo', home: MyselfDemo.MySelfDemoWidget());
}

/**
 * 小实例的Demo
 */
Widget getWidget_2() {
  /**
   * 小实例一：底部导航栏
   */
//  return new MaterialApp(
//    title: '小实例',
//    theme: ThemeData.light(),
//    home: bottom_navigation_widget(),
//  );

  /**
   * 小实例二：底部导航栏（特殊样式）+ 自定义的page界面
   */
//  return new MaterialApp(
//    title: '小实例',
//    theme: ThemeData.light(),
//    home: bottomAppbar(),
//  );

  /**
   * 小实例三：路由动画
   */
//  return new MaterialApp(
//    title: '路由动画',
//    theme: ThemeData(primarySwatch: Colors.yellow),
//    home: pages.FirstWidget(),
//  );

  /**
   * 小实例四：毛玻璃效果
   */
//  return new MaterialApp(
//    title: '毛玻璃效果',
//    theme: ThemeData(primarySwatch: Colors.deepOrange),
//    home: FrostedGlass.FrostedGlassWidget(),
//  );

  /**
   * 小实例五：保存页面状态
   */
//  return new MaterialApp(
//    title: '保存页面状态',
//    theme: ThemeData(primarySwatch: Colors.pink),
//    home: keepAliveDemo.KeepAliveDemo(),
//  );

  /**
   * 小实例六：搜索条
   */
//  return new MaterialApp(
//    title: '搜索条',
//    theme: ThemeData(primarySwatch: Colors.red),
//    home: SearchWidget.SearchWidget(),
//  );

  /**
   * 小实例七： Wrap 流失布局
   */
//  return new MaterialApp(
//    title: 'Wrap 流失布局',
//    theme: ThemeData.light(),
//    home: WarpWidget.WrapWidget(),
//  );

  /**
   * 小实例八：展开闭合案例  ExpansionTile
   */
//  return new MaterialApp(
//    title: "展开闭合demo",
//    theme: ThemeData.dark(),
//    home: ExpansionTitleDemo.ExpansionTitleDemo(),
//  );

  /**
   * 小实例九 ：可展开闭合的List
   */
//  return new MaterialApp(
//    title: "可展开闭合的List",
//    theme: ThemeData.dark(),
//    //是否显示debug图标
//    debugShowCheckedModeBanner: false,
//    home: ExpansionTitleListDemo.ExpansionTitleList(),
//  );

  /**
   * 小实例10：贝塞尔曲线
   */
//  return new MaterialApp(
//    title: "贝塞尔曲线",
//    theme: ThemeData(
//        primarySwatch: Colors.blue
//    ),
//    //是否显示debug图标
//    debugShowCheckedModeBanner: false,
//    home: CustomBesselWidget.CustomBesselWidget(),
//  );

  /**
   * 小实例11：复杂的贝塞尔曲线
   */
//  return new MaterialApp(
//    title: "复杂的贝塞尔曲线",
//    theme: ThemeData(
//        primarySwatch: Colors.blue
//    ),
//    //是否显示debug图标
//    debugShowCheckedModeBanner: true,
//    home: CustomBesselComplexWidget.CustomBesselComplexWidget(),
//  );

  /**
   * 小实例12：欢迎界面 闪屏界面
   */
//  return new MaterialApp(
//    title: "欢迎界面 闪屏界面 ",
//    theme: ThemeData(
//        primarySwatch: Colors.blue
//    ),
//    //是否显示debug图标
//    debugShowCheckedModeBanner: true,
//    home: SplashScreenWidget.SplashScreenWidget(),
//  );

  /**
   * 小实例13：右滑返回上一页
   */
//  return new MaterialApp(
//    title: "右滑返回上一页",
//    theme: ThemeData(
//        primarySwatch: Colors.blue
//    ),
//    //是否显示debug图标
//    debugShowCheckedModeBanner: true,
//    home: RightBackWiget.RightBackWidget(),
//  );

  /**
   * 小实例14：轻量级提示
   */

//  return new MaterialApp(
//    title: '轻量级提示',
//    theme: ThemeData(
//      primarySwatch: Colors.lightBlue
//    ),
//    home: ToolTipsWidget.ToolTipsWidget(),
//  );

  /**
   * 小实例15：滑动拖动控件
   */
  return new MaterialApp(
      title: '滑动拖动控件',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: DargTargetWidget.DargTargetWidget());

  /**
   * 小实例16 技术胖 github上的项目
   */
  return new MaterialApp(
      title: '技术胖 github上的项目',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: DraggableDemo());
}

/**
 * 基本控件
 */
Widget getWidget_1() {
  /**
   * 1、hello world
   */
//  return new HelloWorldApp();

  /**
   * 2、Container  类型快
   */
// return new ContainerApp();

  /**
   * 3、image 图片
   */
//  return new ImageApp();

  /**
   * 4、listView 列表 纵向
   */
//  return new ListViewApp();

  /**
   * 5、横线的ListView
   */
//  return new ListViewHorizontalApp();

  /**
   * 6、动态的listView
   */
//  return new DynamicListViewApp(item: List.generate(100, (i) => 'item-->$i'));

  /**
   * 7、网格列表
   */
//  return new GridViewApp();

  /**
   *8、水平布局
   */
//  return new LevelLayoutWidget();

  /**
   * 9、垂直布局
   */
//  return new VerticalLayoutWidget();

  /**
   * 10、层叠布局
   */
//  return new CascadingLayoutWidget();

  /**
   * 11、定位布局 适应于三个以上控件的定位
   */
//  return new PositionLayoutWidget();

  /**
   * 12、卡片式布局
   */
//  return new cardLayoutWidget();

  /**
   *13、界面间的跳转
   */
//  return new FirstWidget();

  /**
   * 14、直接跳转到其他的.dart文件中去
   */
//  return new MainApp();

  /**
   * 15、导航参数的传递和接收
   */
//  return new IntentWidget();

  /**
   * 16、界面跳转并返回
   */
//  return new returnDataWidget();

  /**
   * 17、本地图片
   */
//  return new locationImage();

  /**
   * 18、打包 详见 https://jjmima.top/2019/04/26/Flutter%20%E6%89%93%E5%8C%85/#more
   */

  /**
   * 19、常用的button
   */

//  return sampleButton();

  /***
   * 20. 文本输入框
   */
//  return MessageForm();

  /**
   * 21、显示弹框
   */
  return new MaterialApp(home: DialogWidget());
}

/**
 * 显示弹框
 */
class DialogWidget extends StatefulWidget {
  @override
  DialogWidgetState createState() => new DialogWidgetState();
}

class DialogWidgetState extends State<DialogWidget> {
  var editControl = null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: getRow());
  }

  Widget getRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: editControl,
          ),
        ),
        RaisedButton(
            child: Text("click"),
            onPressed: () {
              _pressButton(context);
            })
      ],
    );
  }

  _pressButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            //弹出来里面的内容
            content: Text(editControl.text),
            //弹框下面的按钮
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                // 用户点击按钮后，关闭弹框
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    this.editControl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    this.editControl.dispose();
  }
}

/**
 * 文本输入框
 */
class MessageForm extends StatefulWidget {
  @override
  State createState() => new MessageFormState();
}

class MessageFormState extends State<MessageForm> {
  var editController;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      home: new Scaffold(

        body: new Center(
          child: new Column(
            children: [
              Expanded(
                child: TextField(
                  controller: editController,
                ),
              ),
              Expanded(child: new RaisedButton(onPressed: () {
                print('${editController.text}');
              }))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //绑定资源
    editController = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    //释放资源
    editController.dispose();
  }
}

/**
 * 常用的button
 */
class sampleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      home: new Scaffold(

        body: getRaisedBtn(),
      ),
    );
  }

  /**
   * 获取 FlatButton
   */
  Widget getFlatBtn() {
    var flatBtn = FlatButton(
      onPressed: () => print('FlatButton pressed'),
      child: Text('BUTTON'),
      color: Colors.green,
    );
    return flatBtn;
  }

  /**
   * 获取 RaisedButton
   */
  Widget getRaisedBtn() {
    var raisedButton = RaisedButton(
      onPressed: () => print('RaisedButton pressed'),
      child: Text('BUTTON'),
      color: Colors.green,
    );
    return raisedButton;
  }
}

/**
 * 本地图片加载
 */
class locationImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '本地图片',
      home: new Scaffold(

        body: new Center(
          child: new Image.asset('images/icon1.jpg'),
        ),
      ),
    );
  }
}

/**
 * 跳转返回数据
 */
class returnDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '跳转返回数据',
        home: new Scaffold(

          body: new Center(
            child: new RouteButton(),
          ),
        ));
  }
}

/**
 * 自定义的路由控件
 */
class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        return _navigatorToNextPage(context);
      },
      child: const Text('点击进新界面，让新界面返回数据'),
    );
  }

  /**
   * 导航到新的界面
   * async 异步方法
   */
  _navigatorToNextPage(BuildContext context) async {
    // await 等待结果
    final result =
    await Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new resultWidget();
    }));
    //将结果展示出来
    Scaffold.of(context)
        .showSnackBar(new SnackBar(content: new Text('$result')));
  }
}

/**
 * 跳转到结果界面，该界面会返回数据
 */
class resultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                Navigator.pop(context, '返回结果1');
              },
              child: const Text('返回结果1'),
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.pop(context, '返回结果2');
              },
              child: const Text('返回结果2'),
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.pop(context, '返回结果3');
              },
              child: const Text('返回结果3'),
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.pop(context, '返回结果4');
              },
              child: const Text('返回结果4'),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 导航参数的传递和接收
 */
class IntentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: '导航参数的传递和接收',
        //商品列表
        home: getProductList(
            productList: List.generate(100, (i) {
              return new Product('商品$i', '这是第$i个商品');
            })));
  }
}

/**
 * 得到商品列表  导航参数的传递和接收
 */
class getProductList extends StatelessWidget {
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView.builder(
          padding: new EdgeInsets.all(5.0),
          itemCount: this.productList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${productList[index].title}'),
              onTap: () {
                //点击事件 //导航 进入详情界面  将商品信息传递过去
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return new ProductDetails(
                          product: this.productList[index]);
                    }));
              },
            );
          },
        ));
  }

  //构造函数
  getProductList({Key key, @required List<Product> this.productList})
      : super(key: key);
}

/**
 * 界面间的跳转
 * 点击跳转到新的界面
 */
class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: '界面间的跳转',
        //注意 要在把 myHome()提取出来，不然报：Navigator operation requested with a context that does not include a Navigator的错误
        home: myHome());
  }
}

class myHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: new Center(
        child: new RaisedButton(
            onPressed: () {
              //处理跳转的逻辑
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return new SecondWidget();
                  }));
            },
            child: const Text('跳转到新的界面')),
      ),
    );
  }
}

/**
 * 界面的跳转
 * 点击回到上一个界面
 */
class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: new Center(
        child: new RaisedButton(
            onPressed: () {
              //处理返回上一个界面的逻辑
              Navigator.pop(context);
            },
            child: const Text('返回上一个的界面')),
      ),
    );
  }
}

/**
 * 卡片式布局
 */
class cardLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '卡片式布局',
      home: new Center(
        child: new Scaffold(

            body: new Padding(
              padding: new EdgeInsets.all(10.0),
              child:
              //卡片布局
              new Card(
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                        title: new Text(
                          '上海市汤臣一品',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text('电话：123456789'),
                        leading: new Icon(
                          Icons.account_box,
                          color: Colors.lightBlue,
                        )),

                    //分割线
                    new Divider(
                      color: Colors.brown,
                    ),
                    new ListTile(
                        title: new Text(
                          '上海市汤臣一品',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text('电话：123456789'),
                        leading: new Icon(
                          Icons.account_box,
                          color: Colors.lightBlue,
                        )),

                    //分割线
                    new Divider(
                      color: Colors.amber,
                    ),
                    new ListTile(
                        title: new Text(
                          '上海市汤臣一品',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text('电话：123456789'),
                        leading: new Icon(
                          Icons.account_box,
                          color: Colors.lightBlue,
                        )),
                    new Divider(
                      color: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

/**
 * Positioned控件的使用  绝对定位
 */
class PositionLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '定位布局',
      home: new Scaffold(

        body: new Center(
          child: getPositionWidget(),
        ),
      ),
    );
  }

  getPositionWidget() {
    return
      //可以层叠的布局
      new Stack(
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new NetworkImage(
                'https://cdn.pixabay.com/photo/2019/04/18/22/14/bleeding-heart-4138262__340.jpg'),
            radius: 200,
          ),
          new Positioned(
            child: new Text('数据1'),
            top: 20.0,
            left: 20.0,
          ),
          new Positioned(
            child: new Text('数据2'),
            top: 20.0,
            right: 20.0,
          ),
          new Positioned(
            child: new Text('数据3'),
            bottom: 20.0,
            left: 20,
          ),
          new Positioned(
            child: new Text('数据4'),
            bottom: 20.0,
            right: 20,
          )
        ],
      );
  }
}

/**
 * 层叠布局
 */
class CascadingLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '层叠布局',
      home: new Scaffold(

        body: getStackLayoutWidget(),
      ),
    );
  }

  /**
   * 得到层叠布局
   */
  Widget getStackLayoutWidget() {
    return new Center(
      child:
      //层叠布局
      new Stack(
        children: <Widget>[
          //圆角
          new CircleAvatar(
            backgroundImage: new NetworkImage(
                'https://cdn.pixabay.com/photo/2019/04/17/20/49/northern-gannet-4135324__340.jpg'),
            radius: 200.0,
          ),
          new Container(
            child: Text(
              '我是数据哦',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            decoration: BoxDecoration(color: Colors.brown),
            padding: new EdgeInsets.all(1.0),
//              color: Colors.brown,
          )
        ],
        //对齐方式
        //定位 根据下面的widget 在上面Widget的位置 Alignment(0.5, 0.5)
        alignment: Alignment.topCenter,
      ),
    );
  }
}

/**
 * 垂直布局
 */
class VerticalLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '垂直布局',
      home: new Scaffold(

        body: new Center(
          //所有里面的子元素都是横轴的
          child: new Column(
            //横轴对齐方式（）
            crossAxisAlignment: CrossAxisAlignment.start,
            //纵轴的对齐(主轴的对齐方式，因为是Column所以主轴就是竖向的)
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  child: Text('Items1'),
                  color: Colors.greenAccent,
                  alignment: Alignment.center,
                ),
              ),
              new Expanded(child: new Text('Item2---------------------')),
              new Expanded(child: new Text('Item3'))
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * 水平布局
 */
class LevelLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '水平布局',
      home: new Scaffold(

        body:
        //所有里面的子元素都是横轴的
        new Row(
          children: <Widget>[
            /**
             * Expanded 自适应的控件（会灵活的分配），正好填满整个屏幕
             * 灵活布局
             */
            new Expanded(
                child: new RaisedButton(
                  onPressed: () {
                    print('按钮1');
                  },
                  color: Colors.deepPurpleAccent,
                  child: const Text('按钮1'),
                )),
            new Expanded(
                child: new RaisedButton(
                  onPressed: () {
                    print('按钮2');
                  },
                  color: Colors.greenAccent,
                  child: const Text('按钮2'),
                )),
            new Expanded(
                child: new RaisedButton(
                  onPressed: () {
                    print('按钮3');
                  },
                  color: Colors.blueGrey,
                  child: const Text('按钮3'),
                )),
          ],
        ),
      ),
    );
  }
}

/**
 * 网格列表
 */
class GridViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '网格列表',
      home: new Scaffold(
          body: getGridViewTwo()),
    );
  }

  /**
   * 通过GridView 获取GridView
   */
  getGridViewTwo() {
    return new GridView(
      /**
       * 1、SliverGridDelegateWithMaxCrossAxisExtent 根据里面内容多大进行扩展的
       */
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //每一行显示多少列
          crossAxisCount: 3,
          //横轴的距离
          crossAxisSpacing: 5,
          //纵轴的距离
          mainAxisSpacing: 5,
          //横竖比例
          childAspectRatio: 1),
      children: getWidgetImageList(),
      padding: new EdgeInsets.all(5),
    );
  }

  /**
   * 通过GridView.count 获取GridView
   */
  getGridViewOne() {
    return new GridView.count(
      //每一行显示多少列
      crossAxisCount: 3,
      //内边距
      padding: const EdgeInsets.all(20.0),
      //网格里面每个网格的间距
      crossAxisSpacing: 10,

      children: getWidgetTextList(),
    );
  }

  /**
   * 获取 GridView item Text
   */
  getWidgetTextList() {
    List<Widget> listWidget = [];
    for (int i = 0; i < 10; i++) {
      listWidget.add(new Text('GridView-->$i'));
    }
    return listWidget;
  }

  /**
   * 获取 GridView item Image
   */
  getWidgetImageList() {
    List<Widget> listWidget = [];
    for (int i = 0; i < 50; i++) {
      if (i % 2 == 0) {
        listWidget.add(new Image.network(
          'https://cdn.pixabay.com/photo/2019/04/21/00/30/tulip-4143182__340.jpg',
          fit: BoxFit.cover,
        ));
      } else {
        listWidget.add(new Image.network(
          'https://cdn.pixabay.com/photo/2019/04/21/11/11/chess-board-flowers-4143937__340.jpg',
          fit: BoxFit.cover,
        ));
      }
    }
    return listWidget;
  }
}

/**
 * 动态的listView
 */
class DynamicListViewApp extends StatelessWidget {
  final List<String> item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '动态的ListView',
      home: new Scaffold(

        body: ListView.builder(
          //context 上下文、index 索引
          itemBuilder: (context, index) {
            return new ListTile(
                title: new Text('${this.item[index]}'),
                leading: new Icon(Icons.arrow_drop_down));
          },
          itemCount: this.item.length,
        ),
      ),
    );
  }

  //构造方法
  DynamicListViewApp({Key key, @required this.item}) : super(key: key);
}

/**
 * 横向的ListView
 */
class ListViewHorizontalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '横线ListView',
      home: new Scaffold(

        body: new Center(
            child: new Container(
              height: 200.0,
              child: new ListView(
                //设置为横向的listView
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  new Container(
                    width: 180.0,
                    color: Colors.red,
                    child: new Text('横向的ListView1'),
                    alignment: Alignment.center,
                  ),
                  new Container(
                    width: 180.0,
                    color: Colors.blueGrey,
                    child: new Text('横向的ListView2'),
                    alignment: Alignment.center,
                  ),
                  new Container(
                    width: 180.0,
                    color: Colors.deepOrangeAccent,
                    child: new Text('横向的ListView3'),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

/**
 * ListView 列表
 */
class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'ListView',
      home: new Scaffold(

        body: new ListView(children: getImageWidget()),
      ),
    );
  }

  /**
   * 获取 ListTile类型的widget
   */
  Widget getWidget() {
    return new ListTile(
        leading: new Icon(Icons.repeat_one), title: const Text('ListView数据'));
  }

  getImageWidget() {
    List<Widget> listWidget = [];
    for (int i = 0; i < 200; i++) {
      if (i % 2 == 0) {
        listWidget.add(new Container(
          child: new Image.network(
            'https://images.unsplash.com/photo-1555611433-36d9f95463c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.fitWidth,
          ),
          width: 400.0,
          height: 400.0,
          color: Colors.lightBlue,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 1),
        ));
      } else {
        listWidget.add(new Container(
          child: new Image.network(
            'https://images.unsplash.com/photo-1555525088-c3db28e2d0d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.fitHeight,
          ),
          width: 400.0,
          height: 400.0,
          color: Colors.red,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 1),
        ));
      }
    }
    return listWidget;
  }
}

/**
 * image
 */
class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Title',
      home: new Scaffold(

        body: new Center(
          child: new Container(
            child: new Image.network(
              "https://images.unsplash.com/photo-1555847166-ca9cd76d2490?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
              //如何填充
              /**
               * 1、BoxFit.contain   不做任何处理
               * 2、BoxFit.fill      拉伸图片
               * 3、BoxFit.fitWidth  横向必须显示完全
               * 4、BoxFit.fitHeight 纵向必须显示完全
               * 5、BoxFit.cover,    图片可以裁切，但是必须显示全
               */
              fit: BoxFit.cover,
              //图片混合 必须和 color混合使用
              colorBlendMode: BlendMode.dstATop,
              color: Colors.pink,
              //图片是否进行重复 以中心为基础
              repeat: ImageRepeat.repeat,
            ),
            height: 500.0,
            width: 10000.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

/**
 * 容器：Container
 */
class ContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Title',
      home: new Scaffold(

        body: new Center(
          child: new Container(
            child: new Text('基本密码', style: new TextStyle(fontSize: 40.0)),
            // Container中的对齐方式
            alignment: Alignment.topLeft,
            height: 500.0,
            width: 500.0,
            //背景颜色
            /* color: Colors.red,*/
            //内边距 1、EdgeInsets.all(10.0)   所以的边距 2、上下左右边距 EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0)
            padding: new EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
            //外边据 1、EdgeInsets.all(30.0)   所以的边距 2、上下左右边距 EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0)
            margin: const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
            //装饰
            decoration: new BoxDecoration(
              //渐变颜色 注意和 color 不能并用
                gradient: new LinearGradient(
                    colors: [Colors.red, Colors.blue, Colors.yellow]),
                //边框
                border: Border.all(width: 9.0, color: Colors.purple)),
          ),
        ),
      ),
    );
  }
}

/**
 * Hello  world
 * Text 属性
 */
class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter',
      home: new Scaffold(

        body: new Center(
          child: new Text(
            'BodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBody',
            //文字居中对齐方式
            textAlign: TextAlign.center,
            //最大显示几行
            maxLines: 1,
            // 显示的属性 1、ellipsis 省略号 2、fade 从上而下的渐变
            overflow: TextOverflow.fade,
            //字体样式
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.blue,
                //下划线
                decoration: TextDecoration.underline,
                //下划线的类型
                decorationStyle: TextDecorationStyle.solid),
          ),
        ),
      ),
    );
  }
}

/**
 * 得到Appbar
 */
class getAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new AppBar(
        title: new Text(this.name),
      ),
    );
  }

  final String name;

  getAppBarWidget({Key key, @required this.name}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => getSize();

  Size getSize() {
    return new Size(100.0, 52.0);
  }
}
