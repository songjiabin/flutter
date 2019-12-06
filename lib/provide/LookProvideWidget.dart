import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_github/provide/Counter.dart';

class LookProvideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conterProcider = Provider.of<Counter>(context);
    return new Center(
      child: Text('显示count--->${conterProcider.count}',
          style: TextStyle(fontSize: 20)),
    );
  }
}
