import 'package:flutter/material.dart';
import 'package:flutter_github/bean/EchoBean.dart';


/**
 * 消息输入框
 */
class MessageForm extends StatefulWidget {
  @override
  MessageFormState createState() => new MessageFormState();
}

class MessageFormState extends State<MessageForm> {

  var editingController = null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('消息输入框'),
      ),
      body: new Row(
        children: [
          Expanded(
            child:
            //文本输入框
            new TextField(
              controller: editingController,
              decoration: InputDecoration(
                  hintText: '请输入消息',
                  contentPadding: EdgeInsets.all(3.0)
              ),
              //样式
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red
              ),
              // 自动获取焦点。这样在页面打开时就会自动弹出输入法
              autofocus: true,
            ),
          ),
          //有点击波浪形的按钮效果
          InkWell(
            //单机效果
            onTap: onclick,

            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  //边框都为5
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Text('Send'),
            ),
          )
        ],
      ),
    );
  }

  /**
   * 点击按钮
   */
  void onclick() {
    var content = editingController.text;
    //返回上个界面 并带着数据
    EchoBean echoBean = new EchoBean(content, DateTime
        .now()
        .millisecondsSinceEpoch);
    Navigator.pop(context, echoBean);
  }


  @override
  void initState() {
    super.initState();
    this.editingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    editingController.dispose();
  }
}









