import 'package:flutter/material.dart';


/**
 * 登录 改变焦点
 */
class LoginWidget extends StatefulWidget {
  @override
  LoginWidgetState createState() => new LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {

  //焦点控制
  FocusNode _nameFocusNode;
  FocusNode _pwFocusNode;
  TextEditingController _nameController;
  TextEditingController _pwController;


  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _pwFocusNode = FocusNode();
    _nameController = new TextEditingController();
    _pwController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //安全区：更好的适配屏幕
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              //高度的控件
              SizedBox(height: 80.0),

              new Center(
                child: Text('Login', style: TextStyle(fontSize: 20),),
              ),

              Padding(padding: EdgeInsets.all(16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0,),
                  //输入框
                  child: TextField(
                    //输入装饰
                    decoration: InputDecoration(
                      labelText: 'name',
                    ),
                    //焦点
                    focusNode: this._nameFocusNode,
                    //控制器
                    controller: _nameController,
                    //文字输入行动  就是键盘上的 下一步
                    textInputAction: TextInputAction.next,
                    onSubmitted: (input) {
                      //点击后取消焦点
                      _nameFocusNode.unfocus();
                      //将焦点传给下面的密码焦点
                      FocusScope.of(context).requestFocus(_pwFocusNode);
                    },
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.all(16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0,),
                  //输入框
                  child: TextField(
                    //输入装饰
                    decoration: InputDecoration(
                        labelText: 'password'
                    ),
                    focusNode: _pwFocusNode,
                    controller: _pwController,
                    //将文本隐藏
                    obscureText: true,
                    //文字输入行动  就是键盘上的 完成
                    textInputAction: TextInputAction.done,
                    onSubmitted: (input) {
                      //点击后取消焦点
                      _pwFocusNode.unfocus();
                    },
                  ),
                ),
              ),
              //按钮
              ButtonBar(
                children: <Widget>[
                  //点击按钮
                  RaisedButton(
                    onPressed: () {
                      var contentName = this._nameController.text;
                      var contentPw = this._pwController.text;

                      Scaffold.of(context)
                          .showSnackBar(
                          new SnackBar(content: new Text(contentName)));

                      //弹框出来
                      Scaffold.of(context)
                          .showSnackBar(
                          new SnackBar(content: new Text(contentPw)));
                    },
                    child: Text('Login'),
                    color: Colors.blueAccent,
                  ),
                ],
              )
            ],
          )
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }


}