import 'package:flutter/material.dart';


class ExpansionTitleDemo extends StatefulWidget {
  @override
  ExpansionTitleDemoState createState() => new ExpansionTitleDemoState();
}

class ExpansionTitleDemoState extends State<ExpansionTitleDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ExpansionTitle组件'),
      ),
      body: Center(
        child: ExpansionTile(title: const Text('标题'),
          //图标
          leading: Icon(Icons.ac_unit),
          //当打开的时候 显示的背景颜色
          backgroundColor: Colors.lightBlue,
          //当展开的时候需要显示的控件
          children: <Widget>[
            ListTile(
              title: Text('list title'),
              subtitle: Text('sub title'),
            )
          ],
          //默认是打开的吗
          initiallyExpanded: true,
        ),
      ),
    );
  }
}