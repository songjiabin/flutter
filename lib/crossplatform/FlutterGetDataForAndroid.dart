import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

/**
 * 跨平台
 * flutter 从 android 端 得到消息
 */
class  CrossPlatforWidget extends StatefulWidget {
  @override
   CrossPlatforWidgetState createState() => new  CrossPlatforWidgetState();
}


 


class  CrossPlatforWidgetState extends State< CrossPlatforWidget> {

  //双方定义好的通道
  // channel的名称要和Native端的一致。 然后是通过MethodChannel调用的代码
  static const platform =const MethodChannel("com.jeno.flutter_github_sample_1");

  String _battery="未知";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       body: new Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text('电量是：$_battery'),
             new IconButton(icon: Icon(Icons.book), onPressed: (){
               _getBatteryLevel();
             })
           ],
         ),
       ),
    );
  }
  @override
  void initState() {
     super.initState();
  }


  Future  _getBatteryLevel()  async{
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      setState(() {
            this._battery='传过来了->${result}';
          });
    } catch (e) {
      print(e);
    }
  }
}