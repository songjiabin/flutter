import 'package:flutter/material.dart';


/**
 * 跨平台
 * 向android 发送消息
 */
class  CrossPlatforWidget extends StatefulWidget {
  @override
   CrossPlatforWidgetState createState() => new  CrossPlatforWidgetState();
}

class  CrossPlatforWidgetState extends State< CrossPlatforWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


}