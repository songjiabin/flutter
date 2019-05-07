import 'package:flutter/material.dart';
import  'package:flutter_github/example_demo5/KeepAliveDemoPage1.dart' as keepAlivePage;

/**
 * 保存页面状态
 */
class KeepAliveDemo extends StatefulWidget {
  @override
  KeepAliveDemoState createState() => new KeepAliveDemoState();
}


/**
 *  with 混入
 *  SingleTickerProviderStateMixin
 */
class KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    //上部导航  vsync 其实就是刚才with的 SingleTickerProviderStateMixin
    _tabController = new TabController(length: 3, vsync: this);
  }


  /**
   * 销毁的方法
   */
  @override
  void dispose() {
    super.dispose();
    this._tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('KeepAliveDemo'),
        bottom: new TabBar(
          //标签
          tabs: [
            Tab(icon: Icon(Icons.directions_car), child: const Text('汽车')),
            Tab(icon: Icon(Icons.directions_transit), child: const Text('地铁')),
            Tab(icon: Icon(Icons.directions_bike), child: const Text('自行车')),
          ],
          controller: this._tabController,
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          keepAlivePage.KeepAliveDemoPage(),
          keepAlivePage.KeepAliveDemoPage(),
          keepAlivePage.KeepAliveDemoPage(),
        ],
      ),
    );
  }

}