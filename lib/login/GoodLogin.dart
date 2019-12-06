import 'package:flutter/material.dart';

/**
 *
 * 一个好看的登录界面
 */
class GoodLoginPage extends StatefulWidget {
  @override
  GoodLoginPageState createState() => new GoodLoginPageState();
}

class GoodLoginPageState extends State<GoodLoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: buildSignInTextForm(),
    );
  }

  @override
  void initState() {
    super.initState();
  }


  Widget buildSignInTextForm() {
    return new Container(
      //宽度
      width: 300,
      height: 190,
      // 盒子样式
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))
          , color: Colors.white
      ),
      child: new Form(
          child: null
      ),
    );
  }
}