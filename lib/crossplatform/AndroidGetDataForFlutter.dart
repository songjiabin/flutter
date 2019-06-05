import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * 跨平台
 * android 从 flutter  得到消息
 */
class  AndroidGetDataForFlutter extends StatefulWidget {
  @override
   AndroidGetDataForFlutterState createState() => new  AndroidGetDataForFlutterState();
}

class  AndroidGetDataForFlutterState extends State< AndroidGetDataForFlutter> {

  static const platform =MethodChannel('com.jeno.flutter_github_sample_1');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new IconButton(icon: Icon(Icons.map), onPressed:(){
           //调用android的方法 从而通知android调用flutter的方法
          _goAndroidMethod();
        }),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    //注册方法 帮便于android端接受信息
    platform.setMethodCallHandler(platfromCallHandler);
  }



  Future _goAndroidMethod() async{
    try {
       await platform.invokeMethod("getName");

    } catch (e) {
      print(e);
    }
  }


  /**
   * 当android 端调用的时候的回调方法
   */
  Future<dynamic>  platfromCallHandler (MethodCall call) async{
    switch(call.method){
      case 'getName':
        String  name = _getName();
        return name;
        break;
    }
  }



   String  _getName(){
    return '你好android，这个是flutter给你的数据哦！';
  }


}