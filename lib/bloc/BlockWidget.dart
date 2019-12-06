import 'package:flutter/material.dart';


class BlockWidght extends StatefulWidget {
  @override
  State createState() => new BlockWidghtState();
}

class BlockWidghtState extends State<BlockWidght> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text('你好'),
    );
  }

  @override
  void initState() {
    super.initState();
  }


}

class my extends InheritedWidget {
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return null;
  }

}