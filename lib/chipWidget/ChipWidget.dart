import 'package:flutter/material.dart';

/**
 * 标签
 */
class ChipWidget extends StatefulWidget {
  @override
  ChipWidgetState createState() => new ChipWidgetState();
}

class ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Chip(
        label: Text('选择标签'),
        avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            child: Text('01')
        ),
        //当删除的时候
        onDeleted: () {
          print('222222');
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}