import 'package:flutter_github/echo_demo/MessageListScreen.dart';
import 'package:flutter/material.dart';
import 'MessageForm.dart';
import 'package:flutter_github/bean/EchoBean.dart';

/**
 * 发送消息后的列表界面
 */
class MessageListScreen extends StatefulWidget {
  @override
  MessageListScreenState createState() => new MessageListScreenState();
}

class MessageListScreenState extends State<MessageListScreen> {

  final List<EchoBean> message = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('消息列表'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onPress,
          child: Icon(Icons.add),
          tooltip: 'Add message',
        ),
        body:
        // ListView
        ListView.builder(
          // 每个ListView的item
          itemBuilder: (context, index) {
            EchoBean echoBean = message[index];
            final subtitle = DateTime.fromMillisecondsSinceEpoch(echoBean.time)
                .toLocal().toIso8601String();
            return new ListTile(
              title: Text(echoBean.message),
              subtitle: Text(subtitle),
            );
          },

          itemCount: message.length,
        )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  /**
   * 点击事件
   */
  void onPress() async {
    //到发送消息的界面去
    EchoBean result = await Navigator.of(context).push(
        new MaterialPageRoute(builder: (_) {
          return new MessageForm();
        }));
    //得到结果  result ;
    if (result != null) {
      setState(() {
        this.message.add(result);
      });
    }
  }
}













